import 'dart:async';
import 'package:flutter/material.dart';

class EmailVerificationProvider extends ChangeNotifier {
  bool _isVerifying = false;
  String? _verificationMessage;
  bool _isSuccess = false;
  Timer? _messageTimer; // Track the timer

  bool get isVerifying => _isVerifying;
  String? get verificationMessage => _verificationMessage;
  bool get isSuccess => _isSuccess;

  void setVerifying(bool value) {
    _isVerifying = value;
    notifyListeners();
  }

  /// Set the verification message and schedule its auto-reset after 10 seconds
  void setMessage(String? message, {bool isSuccess = false}) {
    // Cancel any existing timer to avoid conflicts
    _messageTimer?.cancel();

    _verificationMessage = message;
    _isSuccess = isSuccess;
    notifyListeners();

    // If a message was set, start a 10-second timer to clear it
    if (message != null) {
      _messageTimer = Timer(const Duration(seconds: 10), () {
        _verificationMessage = null;
        notifyListeners(); // Update UI to remove message
      });
    }
  }

  void reset() {
    _messageTimer?.cancel();
    _isVerifying = false;
    _verificationMessage = null;
    _isSuccess = false;
    notifyListeners();
  }

  /// Cancel the timer when the provider is disposed
  @override
  void dispose() {
    _messageTimer?.cancel();
    super.dispose();
  }
}
