import 'dart:convert';

import 'package:app_links/app_links.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tratrouble/config/api_constants.dart';
import 'package:tratrouble/providers/email_verification_provider.dart';
import 'package:tratrouble/providers/auth_provider.dart';
import 'package:tratrouble/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class EmailVerificationService {
  late AppLinks _appLinks;
  StreamSubscription? _deepLinkSubscription;
  late EmailVerificationProvider _provider;
  late AuthProvider _authProvider;
  late BuildContext _context;

  static final Uuid _uuid = Uuid();
  static const String _deviceIdKey = 'app_device_id';

  static Future<String> getDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    String? deviceId = prefs.getString(_deviceIdKey);

    if (deviceId == null) {
      // We generate device ids that are basically random UUIDs.
      deviceId = 'device_${_uuid.v4()}';
      await prefs.setString(_deviceIdKey, deviceId);
    }

    return deviceId;
  }

  // Method to reset device ID (for future privacy controls)
  static Future<void> resetDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_deviceIdKey);
  }

  void initDeepLinkListener(BuildContext context) {
    _appLinks = AppLinks();
    _provider = context.read<EmailVerificationProvider>();
    _authProvider = context.read<AuthProvider>();
    _context = context;

    // Capture localized strings before setting up listener
    final s = S.of(_context);

    // Listen for incoming deep links
    _deepLinkSubscription = _appLinks.uriLinkStream.listen(
      (Uri uri) {
        _handleDeepLink(uri);
      },
      onError: (err) {
        _provider.setMessage(s.deepLinkError(err.toString()));
      },
    );
  }

  void _handleDeepLink(Uri uri) {
    // Handle custom scheme: com.chobycat.tratrouble://verify?token=...
    if (uri.scheme == 'com.chobycat.tratrouble' && uri.host == 'verify') {
      final token = uri.queryParameters['token'];
      if (token != null) {
        _verifyEmail(token);
      }
      return;
    }

    // Handle HTTPS scheme: https://tratrouble.chobycat.com/api/verify-email/?token=...
    if (uri.scheme == 'https' && uri.host == 'tratrouble.chobycat.com') {
      final path = uri.path;
      if (path == '/api/verify-email/' || path == '/api/verify-email') {
        final token = uri.queryParameters['token'];
        if (token != null) {
          _verifyEmail(token);
        }
      }
    }
  }

  Future<void> _verifyEmail(String token) async {
    _provider.setVerifying(true);

    // Capture localized strings before async operation
    final successMessage = S.of(_context).emailVerifiedSuccessfully;
    final s = S.of(_context);

    try {
      final deviceId = await getDeviceId();
      final response = await http.post(
        Uri.parse(ApiConstants.verifyEmailUrl),
        headers: {'Content-Type': 'application/json', 'X-Device-ID': deviceId},
        body: json.encode({'token': token, 'platform': 'mobile'}),
      );

      if (response.statusCode == 200) {
        // Success: store token, update auth state, and show success message
        await _authProvider.setLoggedIn(token);
        _provider.setMessage(successMessage, isSuccess: true);
      } else if (response.statusCode == 409) {
        // Conflict: email already verified, but store token and update auth state anyway
        await _authProvider.setLoggedIn(token);
        _provider.setMessage(s.emailAlreadyVerified, isSuccess: true);
      } else if (response.statusCode == 410) {
        // Gone: verification link expired
        _provider.setMessage(s.verificationLinkExpired);
      } else {
        _provider.setMessage(
          s.verificationFailed('HTTP ${response.statusCode}'),
        );
      }
    } catch (e) {
      _provider.setMessage(s.verificationError(e.toString()));
    } finally {
      _provider.setVerifying(false);
    }
  }

  void dispose() {
    _deepLinkSubscription?.cancel();
  }
}
