import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../generated/l10n.dart';
import '../v6_vbb/departure.dart';

class DepartureScreen extends StatefulWidget {
  final String stopId;

  const DepartureScreen({super.key, required this.stopId});

  @override
  State<DepartureScreen> createState() => _DepartureScreenState();
}

class _DepartureScreenState extends State<DepartureScreen> {
  List<Departure>? _departures;
  String? _errorMessage;
  int _duration = 15;

  @override
  void initState() {
    super.initState();
    _fetchDepartures();
  }

  Future<void> _fetchDepartures() async {
    final url = Uri.parse(
      'https://v6.vbb.transport.rest/stops/${widget.stopId}/departures?duration=$_duration',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = json.decode(response.body);
        final List<dynamic> departuresJson = jsonMap['departures'];
        final departures = Departure.listFromJson(departuresJson);
        setState(() {
          _departures = departures;
          _errorMessage = null;
        });
      } else {
        setState(() {
          _errorMessage =
              'Failed to load departures: HTTP ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load departures: $e';
      });
    }
  }

  void _incrementDuration() {
    setState(() {
      _duration += 5;
    });
    _fetchDepartures();
  }

  void _decrementDuration() {
    setState(() {
      _duration = (_duration - 5).clamp(0, 120);
    });
    _fetchDepartures();
  }

  String _extractTime(String isoDateTime) {
    try {
      final dateTime = DateTime.parse(isoDateTime);
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return isoDateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).departures),
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
                    readOnly: true,
                    controller: TextEditingController(
                      text: _duration.toString(),
                    ),
                    style: const TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      labelText: 'Time window (minutes)',
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _decrementDuration,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Icon(Icons.remove, size: 32),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _incrementDuration,
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
          Expanded(
            child: _errorMessage != null
                ? Center(child: Text(_errorMessage!))
                : _departures == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _departures!.length,
                    itemBuilder: (context, index) {
                      final departure = _departures![index];
                      return ListTile(
                        title: Text(
                          '${_extractTime(departure.plannedWhen)} / ${_extractTime(departure.when)}',
                        ),
                        subtitle: Text(
                          '${departure.line.name} to ${departure.direction}',
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
