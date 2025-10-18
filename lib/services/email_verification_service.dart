import 'package:app_links/app_links.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tratrouble/config/api_constants.dart';
import 'package:tratrouble/providers/email_verification_provider.dart';
import 'package:tratrouble/providers/auth_provider.dart';
import 'package:tratrouble/generated/l10n.dart';

class EmailVerificationService {
  late AppLinks _appLinks;
  StreamSubscription? _deepLinkSubscription;
  late EmailVerificationProvider _provider;
  late AuthProvider _authProvider;
  late BuildContext _context;

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
    if (uri.scheme == 'com.chobycat.tratrouble' && uri.host == 'verify') {
      final token = uri.queryParameters['token'];

      if (token != null) {
        _verifyEmail(token);
      }
    }
  }

  Future<void> _verifyEmail(String token) async {
    _provider.setVerifying(true);

    // Capture localized strings before async operation
    final successMessage = S.of(_context).emailVerifiedSuccessfully;
    final s = S.of(_context);

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.verifyEmailUrl),
        body: {'token': token},
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
