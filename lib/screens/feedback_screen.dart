import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _emailController = TextEditingController();

  void _submitFeedback() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).feedbackSubmittedTitle),
        content: Text(S.of(context).feedbackSubmittedContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).transportFeedback),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'lore ipsum etc.', // This string can also be localized if desired
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: S.of(context).emailLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitFeedback,
                child: Text(S.of(context).ok),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
