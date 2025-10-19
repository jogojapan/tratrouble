import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tratrouble/config/api_constants.dart';
import 'package:tratrouble/services/email_verification_service.dart';
import 'dart:convert';
import '../generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _submitEmail() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() {
        _errorMessage = S.of(context).emailRequired;
      });
      return;
    }

    final deviceId = await EmailVerificationService.getDeviceId();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.submitEmailUrl),
        headers: {'Content-Type': 'application/json', 'X-Device-ID': deviceId},
        body: json.encode({'email': email, 'platform': 'mobile'}),
      );

      if (!mounted) {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).submitEmailSuccess)),
        );
        Navigator.of(context).pop();
      } else {
        setState(() {
          _errorMessage = S
              .of(context)
              .submitEmailFailed('HTTP ${response.statusCode}');
          _isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = S.of(context).submitEmailFailed(e.toString());
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).login),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: S.of(context).email,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitEmail,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : Text(S.of(context).submit),
            ),
          ],
        ),
      ),
    );
  }
}
