import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../generated/l10n.dart';
import '../v6_vbb/tra_stop.dart';
import 'departure_screen.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({super.key});

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  Position? _currentPosition;
  String? _errorMessage;
  List<TraStop>? _nearbyStops;
  int _distance = 500;
  final TextEditingController _distanceController = TextEditingController(
    text: '500',
  );

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  void dispose() {
    _distanceController.dispose();
    super.dispose();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _errorMessage = S.of(context).locationServicesDisabled;
      });
      _goBack();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _errorMessage = S.of(context).locationPermissionDenied;
        });
        _goBack();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _errorMessage = S.of(context).locationPermissionDeniedForever;
      });
      _goBack();
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
        _errorMessage = null;
      });
      await _fetchNearbyStops();
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
      _goBack();
    }
  }

  Future<void> _fetchNearbyStops() async {
    if (_currentPosition == null) return;

    final url = Uri.parse(
      'https://v6.vbb.transport.rest/locations/nearby?latitude=${_currentPosition!.latitude}&longitude=${_currentPosition!.longitude}&distance=$_distance',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        final stops = TraStop.listFromJson(jsonList);
        setState(() {
          _nearbyStops = stops;
        });
      } else {
        setState(() {
          _errorMessage =
              'Failed to load nearby stops: HTTP ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load nearby stops: $e';
      });
    }
  }

  void _goBack() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    });
  }

  void _incrementDistance() {
    setState(() {
      _distance += 100;
      _distanceController.text = _distance.toString();
    });
    _fetchNearbyStops();
  }

  void _decrementDistance() {
    setState(() {
      _distance = (_distance - 100).clamp(0, 10000);
      _distanceController.text = _distance.toString();
    });
    _fetchNearbyStops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).departNearby),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: double.infinity,
                  child: TextField(
                    controller: _distanceController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      labelText: 'Distance (meters)',
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSubmitted: (value) {
                      final parsed = int.tryParse(value);
                      if (parsed != null && parsed > 0) {
                        setState(() {
                          _distance = parsed;
                        });
                        _fetchNearbyStops();
                      } else {
                        _distanceController.text = _distance.toString();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _decrementDistance,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Icon(Icons.remove, size: 32),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _incrementDistance,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Icon(Icons.add, size: 32),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: _errorMessage != null
                ? Center(child: Text(_errorMessage!))
                : _nearbyStops == null
                ? Center(
                    child: _currentPosition == null
                        ? const CircularProgressIndicator()
                        : const Text('Loading nearby stops...'),
                  )
                : ListView.builder(
                    itemCount: _nearbyStops!.length,
                    itemBuilder: (context, index) {
                      final stop = _nearbyStops![index];
                      return ListTile(
                        title: Text(stop.name),
                        subtitle: Text('${stop.distance} m'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DepartureScreen(stopId: stop.id),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
