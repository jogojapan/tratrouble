import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class OnBusScreen extends StatelessWidget {
  const OnBusScreen({super.key});

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
      body: const Center(child: Text('')),
    );
  }
}
