import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import '../generated/l10n.dart';

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
    if (isReady && _currentLocation != null) {
      await controller.moveTo(_currentLocation!);
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
