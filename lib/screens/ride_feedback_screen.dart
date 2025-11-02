import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import '../v6_vbb/movement_response.dart';
import '../generated/l10n.dart';
import '../config/api_constants.dart';
import '../providers/auth_provider.dart';

class RideFeedbackScreen extends StatefulWidget {
  final Movement movement;

  const RideFeedbackScreen({super.key, required this.movement});

  @override
  State<RideFeedbackScreen> createState() => _RideFeedbackScreenState();
}

class _RideFeedbackScreenState extends State<RideFeedbackScreen> {
  // Punctuality
  String? _selectedPunctuality;

  // Onboard info display
  String? _selectedInfoDisplay;

  // Onboard announcements
  String? _selectedAnnouncements;

  // Capacity
  String? _selectedCapacity;

  // Driving style
  String? _selectedDrivingStyle;

  // Cleanliness (multi-choice)
  final Set<String> _selectedCleanliness = {};

  // Temperature
  String? _selectedTemperature;

  // Passenger behavior
  String? _selectedPassengerBehavior;

  // Additional comments
  final TextEditingController _commentsController = TextEditingController();

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    final authProvider = context.read<AuthProvider>();

    // Check if user is logged in
    if (!authProvider.isLoggedIn) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(S.of(context).login)));
      return;
    }

    try {
      final feedbackData = {
        'movementId': widget.movement.tripId,
        'token': authProvider.token,
        'lineName': widget.movement.line.name,
        'direction': widget.movement.direction,
        'feedbackTimestamp': DateTime.now().toIso8601String(),
        'punctuality': _selectedPunctuality,
        'onboardInfoDisplay': _selectedInfoDisplay,
        'onboardAnnouncements': _selectedAnnouncements,
        'capacity': _selectedCapacity,
        'drivingStyle': _selectedDrivingStyle,
        'cleanliness': _selectedCleanliness.toList(),
        'temperature': _selectedTemperature,
        'passengerBehavior': _selectedPassengerBehavior,
        'additionalComments': _commentsController.text,
      };

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}/api/ride-feedback/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authProvider.token}',
        },
        body: json.encode(feedbackData),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).feedbackSubmittedContent),
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              S.of(context).submitEmailFailed('HTTP ${response.statusCode}'),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).submitEmailFailed(e.toString())),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _toggleCleanliness(String option) {
    setState(() {
      if (option == 'noProblems') {
        // If "no problems" is selected, clear all other options
        if (_selectedCleanliness.contains('noProblems')) {
          _selectedCleanliness.remove('noProblems');
        } else {
          _selectedCleanliness.clear();
          _selectedCleanliness.add('noProblems');
        }
      } else {
        // If any other option is selected, remove "no problems"
        _selectedCleanliness.remove('noProblems');
        if (_selectedCleanliness.contains(option)) {
          _selectedCleanliness.remove(option);
        } else {
          _selectedCleanliness.add(option);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final line = widget.movement.line;

    return Scaffold(
      appBar: AppBar(
        title: Text(s.rideFeedback),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle info header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${line.name} - ${widget.movement.direction}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      line.productName,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Punctuality
            _buildSectionTitle(s.punctuality),
            _buildRadioGroup(
              [
                (s.onTime, 'onTime'),
                (s.late1to2Min, 'late1to2Min'),
                (s.lateMoreThan2Min, 'lateMoreThan2Min'),
                (s.earlyDeparture1to2Min, 'earlyDeparture1to2Min'),
                (s.earlyDepartureMoreThan2Min, 'earlyDepartureMoreThan2Min'),
              ],
              _selectedPunctuality,
              (value) => setState(() => _selectedPunctuality = value),
            ),
            const SizedBox(height: 20),

            // Onboard info display
            _buildSectionTitle(s.onboardInfoDisplay),
            _buildRadioGroup(
              [
                (s.displayFunctional, 'displayFunctional'),
                (s.displayBroken, 'displayBroken'),
                (s.displayNonExisting, 'displayNonExisting'),
              ],
              _selectedInfoDisplay,
              (value) => setState(() => _selectedInfoDisplay = value),
            ),
            const SizedBox(height: 20),

            // Onboard announcements
            _buildSectionTitle(s.onboardAnnouncements),
            _buildRadioGroup(
              [
                (s.clearAnnouncements, 'clearAnnouncements'),
                (s.unclearAnnouncements, 'unclearAnnouncements'),
                (s.noAnnouncements, 'noAnnouncements'),
              ],
              _selectedAnnouncements,
              (value) => setState(() => _selectedAnnouncements = value),
            ),
            const SizedBox(height: 20),

            // Capacity
            _buildSectionTitle(s.capacity),
            _buildRadioGroup(
              [
                (s.gotASeat, 'gotASeat'),
                (s.couldStandComfortably, 'couldStandComfortably'),
                (s.overcrowded, 'overcrowded'),
              ],
              _selectedCapacity,
              (value) => setState(() => _selectedCapacity = value),
            ),
            const SizedBox(height: 20),

            // Driving style
            _buildSectionTitle(s.drivingStyle),
            _buildRadioGroup(
              [
                (s.safeDriving, 'safeDriving'),
                (s.roughDriving, 'roughDriving'),
                (s.soRoughSomebodyFell, 'soRoughSomebodyFell'),
              ],
              _selectedDrivingStyle,
              (value) => setState(() => _selectedDrivingStyle = value),
            ),
            const SizedBox(height: 20),

            // Cleanliness (multi-choice)
            _buildSectionTitle(s.cleanliness),
            _buildCheckboxGroup(
              [
                (s.greasySurfaces, 'greasySurfaces'),
                (s.someGarbage, 'someGarbage'),
                (s.lotsOfGarbage, 'lotsOfGarbage'),
                (s.liquidDirtOrVomit, 'liquidDirtOrVomit'),
                (s.smelly, 'smelly'),
                (s.extremeSmell, 'extremeSmell'),
                (s.noProblems, 'noProblems'),
              ],
              _selectedCleanliness,
              _toggleCleanliness,
            ),
            const SizedBox(height: 20),

            // Temperature
            _buildSectionTitle(s.temperature),
            _buildRadioGroup(
              [
                (s.tooWarm, 'tooWarm'),
                (s.tooCold, 'tooCold'),
                (s.temperatureOk, 'temperatureOk'),
              ],
              _selectedTemperature,
              (value) => setState(() => _selectedTemperature = value),
            ),
            const SizedBox(height: 20),

            // Passenger behavior
            _buildSectionTitle(s.passengerBehavior),
            _buildRadioGroup(
              [
                (s.noProblems, 'noProblems'),
                (s.aggressiveBehavior, 'aggressiveBehavior'),
                (s.drunkPerson, 'drunkPerson'),
              ],
              _selectedPassengerBehavior,
              (value) => setState(() => _selectedPassengerBehavior = value),
            ),
            const SizedBox(height: 20),

            // Additional comments
            _buildSectionTitle(s.additionalComments),
            TextField(
              controller: _commentsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: s.additionalComments,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 24),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitFeedback,
                child: Text(s.submitFeedback),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRadioGroup(
    List<(String label, String value)> options,
    String? selectedValue,
    Function(String) onChanged,
  ) {
    return Column(
      children: options.map((option) {
        final (label, value) = option;
        return RadioListTile<String>(
          title: Text(label),
          value: value,
          groupValue: selectedValue,
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildCheckboxGroup(
    List<(String label, String value)> options,
    Set<String> selectedValues,
    Function(String) onChanged,
  ) {
    return Column(
      children: options.map((option) {
        final (label, value) = option;
        return CheckboxListTile(
          title: Text(label),
          value: selectedValues.contains(value),
          onChanged: (newValue) {
            onChanged(value);
          },
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }
}
