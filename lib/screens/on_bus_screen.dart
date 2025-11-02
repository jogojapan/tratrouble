import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../v6_vbb/movement_response.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import '../generated/l10n.dart';
import 'package:tratrouble/config/api_constants.dart';
import 'package:tratrouble/utils/secure_storage.dart';
import 'ride_feedback_screen.dart';

class OnBusScreen extends StatefulWidget {
  const OnBusScreen({super.key});

  @override
  State<OnBusScreen> createState() => _OnBusScreenState();
}

class _OnBusScreenState extends State<OnBusScreen> with OSMMixinObserver {
  late MapController controller;
  GeoPoint? _currentLocation;
  String? _errorMessage;
  Timer? _debounceTimer;
  Timer? _periodicTimer;
  GeoPoint? _lastMapCenter;
  bool _popupVisible = false;
  static const int _debounceDelayMs = 1000; // 1 second debounce delay
  GeoPoint? _lastLoadedLocation;
  static const double _minLocationChangeThreshold = 0.002; // ~200 meters
  final List<GeoPoint> _currentMarkers = []; // Track current markers
  final Map<String, Movement> _markerToMovement =
      {}; // Map markers to movements
  Movement? _selectedMovement; // Currently selected movement for popup

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition: GeoPoint(latitude: 52.5, longitude: 13.4),
    );
    controller.addObserver(this);
    _determinePosition();

    // Start periodic timer to reload movements every 3 seconds
    _periodicTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (mounted && _lastMapCenter != null && !_popupVisible) {
        await _loadMovementsAroundLocation(_lastMapCenter!);
      }
    });
  }

  void _onMapRegionChanged(GeoPoint newCenter) {
    _lastMapCenter = newCenter;
    // Cancel previous debounce timer
    _debounceTimer?.cancel();

    // Check if location has changed significantly
    if (_lastLoadedLocation != null) {
      final latDiff = (newCenter.latitude - _lastLoadedLocation!.latitude)
          .abs();
      final lonDiff = (newCenter.longitude - _lastLoadedLocation!.longitude)
          .abs();

      if (latDiff < _minLocationChangeThreshold &&
          lonDiff < _minLocationChangeThreshold) {
        return; // Location change is too small, ignore
      }
    }

    // Set debounce timer to load movements after delay
    _debounceTimer = Timer(Duration(milliseconds: _debounceDelayMs), () {
      _loadMovementsAroundLocation(newCenter);
    });
  }

  /// Called when the map region changes (user pans/drags the map)
  @override
  void onRegionChanged(Region region) {
    super.onRegionChanged(region);
    _onMapRegionChanged(region.center);
  }

  Future<void> _clearAllMarkers() async {
    for (final marker in _currentMarkers) {
      try {
        await controller.removeMarker(marker);
      } catch (e) {
        // Silently ignore errors when removing individual markers
      }
    }
    _currentMarkers.clear();
    _markerToMovement.clear();
    setState(() {
      _selectedMovement = null;
    });
  }

  Future<void> _loadMovementsAroundLocation(GeoPoint center) async {
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
          // Clear old markers before adding new ones
          await _clearAllMarkers();
          await _addMovementMarkers(movementResponse.movements);
          // Update last loaded location
          _lastLoadedLocation = center;
        } catch (e) {
          if (!mounted) return;
          final authProvider = context.read<AuthProvider>();
          if (authProvider.isLoggedIn) {
            final token = await SecureStorage.getToken();
            await http.post(
              Uri.parse(ApiConstants.badJsonUrl),
              headers: {'Content-Type': 'application/json'},
              body: json.encode({'token': token, 'url': url, 'data': jsonData}),
            );
          }
        }
      } else {
        if (mounted) {
          setState(() {
            _errorMessage =
                'Failed to load movements: HTTP ${httpResponse.statusCode}';
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Error loading movements: $e';
        });
      }
    }
  }

  Future<void> _addMovementMarkers(List<Movement> movements) async {
    for (final movement in movements) {
      final location = movement.location;
      final line = movement.line;
      final productName = line.productName.toLowerCase();
      Icon icon;
      if (productName == 'bus') {
        icon = Icon(
          Icons.directions_bus_rounded,
          color: Colors.black,
          size: 60,
        );
      } else if (productName == 's-bahn' ||
          productName == 's' ||
          productName == 're' ||
          productName == 'rb' ||
          productName == 'rb/re') {
        icon = Icon(
          Icons.directions_railway_rounded,
          color: const Color.fromARGB(255, 190, 72, 28),
          size: 60,
        );
      } else if (productName == 'tram') {
        icon = Icon(
          Icons.tram_rounded,
          color: Colors.deepPurpleAccent,
          size: 60,
        );
      } else if (productName == 'u-bahn' || productName == 'u') {
        icon = Icon(Icons.subway_rounded, color: Colors.blue, size: 60);
      } else if (productName == 'ice') {
        icon = Icon(
          Icons.directions_railway_filled_sharp,
          color: Colors.blueGrey,
          size: 60,
        );
      } else {
        //print("Unknown product name: $productName");
        icon = Icon(
          Icons.question_mark_rounded,
          color: Colors.black38,
          size: 60,
        );
      }

      GeoPoint markerLocation = GeoPoint(
        latitude: location.latitude,
        longitude: location.longitude,
      );

      MarkerIcon markerIcon = MarkerIcon(icon: icon);
      await controller.addMarker(markerLocation, markerIcon: markerIcon);
      _currentMarkers.add(markerLocation);

      // Store the movement data associated with this marker
      final markerKey =
          '${markerLocation.latitude},${markerLocation.longitude}';
      _markerToMovement[markerKey] = movement;
    }
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady && _currentLocation != null) {
      await controller.moveTo(_currentLocation!);
      await _loadMovementsAroundLocation(_currentLocation!);
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

  void _onMarkerTapped(GeoPoint markerLocation) {
    final markerKey = '${markerLocation.latitude},${markerLocation.longitude}';
    final movement = _markerToMovement[markerKey];
    if (movement != null) {
      setState(() {
        _selectedMovement = movement;
        _popupVisible = true;
      });
    }
  }

  void _dismissPopup() {
    setState(() {
      _selectedMovement = null;
      _popupVisible = false;
    });
  }

  Future<void> _onBoardVehicle(Movement movement) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RideFeedbackScreen(movement: movement),
      ),
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _periodicTimer?.cancel();
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
          : Stack(
              children: [
                OSMFlutter(
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
                        icon: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 48,
                        ),
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
                  onGeoPointClicked: (GeoPoint geoPoint) {
                    _onMarkerTapped(geoPoint);
                  },
                ),
                // Dismiss popup when tapping outside of it
                if (_selectedMovement != null)
                  GestureDetector(
                    onTap: _dismissPopup,
                    child: Container(color: Colors.transparent),
                  ),
                // Popup showing vehicle information
                if (_selectedMovement != null)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Prevent dismissing when tapping inside the popup
                      },
                      child: _buildVehicleInfoPopup(_selectedMovement!),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildVehicleInfoPopup(Movement movement) {
    final line = movement.line;
    final productName = line.productName.toLowerCase();

    // Determine the button label based on vehicle type
    String buttonLabel;
    if (productName == 'bus') {
      buttonLabel = S.of(context).iAmOnThisBus;
    } else if (productName == 's-bahn' ||
        productName == 're' ||
        productName == 'rb' ||
        productName == 'rb/re') {
      buttonLabel = S.of(context).iAmOnThisTrain;
    } else if (productName == 'tram') {
      buttonLabel = S.of(context).iAmOnThisTram;
    } else {
      buttonLabel = 'I am on this vehicle';
    }

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: _dismissPopup,
                child: const Icon(Icons.close, size: 24),
              ),
            ),
            const SizedBox(height: 8),
            // Line name
            Text(
              line.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Direction
            Text(
              movement.direction,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Button
            ElevatedButton(
              onPressed: () {
                _onBoardVehicle(movement);
                _dismissPopup();
              },
              child: Text(buttonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
