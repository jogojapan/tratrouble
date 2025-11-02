import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../v6_vbb/movement_response.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import '../generated/l10n.dart';
import 'package:tratrouble/config/api_constants.dart';
import 'package:tratrouble/utils/secure_storage.dart';

class OnBusScreen extends StatefulWidget {
  const OnBusScreen({super.key});

  @override
  State<OnBusScreen> createState() => _OnBusScreenState();
}

class _OnBusScreenState extends State<OnBusScreen> with OSMMixinObserver {
  late MapController controller;
  GeoPoint? _currentLocation;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition: GeoPoint(latitude: 52.5, longitude: 13.4),
    );
    controller.addObserver(this);
    _determinePosition();
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    void addMovementMarkers(List<Movement> movements) async {
      for (final movement in movements) {
        final location = movement.location;
        final line = movement.line;
        final productName = line.productName.toLowerCase();
        Color color;
        if (productName == 'bus') {
          color = Colors.yellow;
        } else if (productName == 's-bahn' ||
            productName == 're' ||
            productName == 'rb' ||
            productName == 'rb/re') {
          color = Colors.blue;
        } else if (productName == 'tram') {
          color = Colors.red;
        } else {
          color = Colors.grey;
        }

        GeoPoint markerLocation = GeoPoint(
          latitude: location.latitude,
          longitude: location.longitude,
        );

        MarkerIcon markerIcon = MarkerIcon(
          icon: Icon(Icons.circle, color: color, size: 16),
        );

        await controller.addMarker(markerLocation, markerIcon: markerIcon);
      }
    }

    Future<void> loadMovementsAroundLocation(GeoPoint center) async {
      // Compute bounding box roughly half a square kilometer (~0.5km x 0.5km)
      // Approximate 0.005 degrees latitude and longitude ~ 0.5 km
      final double latDelta = 0.005;
      final double lonDelta = 0.005;
      final double north = center.latitude + latDelta;
      final double south = center.latitude - latDelta;
      final double east = center.longitude + lonDelta;
      final double west = center.longitude - lonDelta;

      final int results = 10;
      final String url =
          'https://v6.vbb.transport.rest/radar?north=$north&west=$west&south=$south&east=$east&results=$results';

      try {
        final response = Uri.parse(url).resolveUri(Uri());
        final httpResponse = await http.get(response);
        if (httpResponse.statusCode == 200) {
          final jsonData = json.decode(httpResponse.body);
          try {
            final movementResponse = MovementResponse.fromJson(jsonData);
            addMovementMarkers(movementResponse.movements);
          } catch (e) {
            if (!mounted) return;
            final authProvider = context.read<AuthProvider>();
            if (authProvider.isLoggedIn) {
              final token = await SecureStorage.getToken();
              await http.post(
                Uri.parse(ApiConstants.badJsonUrl),
                headers: {'Content-Type': 'application/json'},
                body: json.encode({
                  'token': token,
                  'url': url,
                  'data': jsonData,
                }),
              );
            }
            //setState(() {
            //  _errorMessage = 'Error loading movements: $e';
            //});
          }
        } else {
          setState(() {
            _errorMessage =
                'Failed to load movements: HTTP ${httpResponse.statusCode}';
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'Error loading movements: $e';
        });
      }
    }

    if (isReady && _currentLocation != null) {
      await controller.moveTo(_currentLocation!);
      await loadMovementsAroundLocation(_currentLocation!);
    }
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _errorMessage = S.of(context).locationServicesDisabled;
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _errorMessage = S.of(context).locationPermissionDenied;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _errorMessage = S.of(context).locationPermissionDeniedForever;
      });
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentLocation = GeoPoint(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        _errorMessage = null;
      });
      // The map will be moved to location in mapIsReady callback
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).onTheBus),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _errorMessage != null
          ? Center(child: Text(_errorMessage!))
          : OSMFlutter(
              controller: controller,
              osmOption: OSMOption(
                userTrackingOption: const UserTrackingOption(
                  enableTracking: false,
                  unFollowUser: false,
                ),
                zoomOption: const ZoomOption(
                  initZoom: 16,
                  minZoomLevel: 8,
                  maxZoomLevel: 18,
                  stepZoom: 1.0,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(Icons.location_pin, color: Colors.red, size: 48),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(Icons.navigation, size: 48),
                  ),
                ),
                roadConfiguration: const RoadOption(
                  roadColor: Colors.blue,
                  roadWidth: 10,
                ),
              ),
            ),
    );
  }
}
