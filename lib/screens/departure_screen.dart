import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../generated/l10n.dart';
import '../v6_vbb/departure.dart';
import '../widgets/time_window_selector.dart';

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
  int _minutesAgo = 0;
  final TextEditingController _minutesAgoController = TextEditingController(
    text: '0',
  );

  @override
  void initState() {
    super.initState();
    _fetchDepartures();
  }

  @override
  void dispose() {
    _minutesAgoController.dispose();
    super.dispose();
  }

  Future<void> _fetchDepartures() async {
    // Calculate start of time window
    final startMinute = 60 + _minutesAgo - (_duration ~/ 2);

    String whenParam;
    if (startMinute == 60) {
      whenParam = 'now';
    } else if (startMinute < 60) {
      whenParam = '${60 - startMinute} minutes ago';
    } else {
      whenParam = 'in ${startMinute - 60} minutes';
    }

    final url = Uri.parse(
      'https://v6.vbb.transport.rest/stops/${widget.stopId}/departures?duration=$_duration&when=$whenParam',
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

  String _extractTime(String isoDateTime) {
    try {
      final dateTime = DateTime.parse(isoDateTime).toLocal();
      final formatter = DateFormat.Hm(); // 'HH:mm' format
      return formatter.format(dateTime);
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
                TimeWindowSelector(
                  durationMinutes: _duration,
                  offsetMinutes: _minutesAgo,
                  onDurationChanged: (newDuration) {
                    setState(() {
                      _duration = newDuration;
                      // Keep offset unchanged to keep left end fixed
                    });
                    _fetchDepartures();
                  },
                  onOffsetChanged: (newOffset) {
                    setState(() {
                      _minutesAgo = newOffset;
                      _minutesAgoController.text = newOffset.toString();
                    });
                    _fetchDepartures();
                  },
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
                          '${departure.line.name} ${S.of(context).to} ${departure.direction}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Row(
                          children: [
                            Text(_extractTime(departure.plannedWhen)),
                            const SizedBox(width: 8),
                            Builder(
                              builder: (context) {
                                final planned = DateTime.tryParse(
                                  departure.plannedWhen,
                                );
                                final actual = DateTime.tryParse(
                                  departure.when,
                                );
                                if (planned == null || actual == null) {
                                  return const SizedBox.shrink();
                                }
                                final diff = actual
                                    .difference(planned)
                                    .inMinutes;
                                if (diff == 0) return const SizedBox.shrink();
                                final sign = diff > 0 ? '+' : '-';
                                return Text(
                                  '$sign${diff.abs()} ${S.of(context).min}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ],
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
