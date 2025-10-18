import 'package:flutter/material.dart';
import 'package:tratrouble/utils/secure_storage.dart';

/// Provider for managing authentication state
///
/// Tracks whether the user is logged in by checking for a stored token
class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _token;

  bool get isLoggedIn => _isLoggedIn;
  String? get token => _token;

  /// Initialize the auth state by checking for an existing token
  Future<void> initialize() async {
    _token = await SecureStorage.getToken();
    _isLoggedIn = _token != null;
    notifyListeners();
  }

  /// Called when email verification succeeds
  /// Updates the login state and stores the token
  Future<void> setLoggedIn(String token) async {
    _token = token;
    _isLoggedIn = true;
    await SecureStorage.saveToken(token);
    notifyListeners();
  }

  /// Logout the user by clearing the token
  Future<void> logout() async {
    _token = null;
    _isLoggedIn = false;
    await SecureStorage.deleteToken();
    notifyListeners();
  }
}
