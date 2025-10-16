// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TraTrouble`
  String get appTitle {
    return Intl.message('TraTrouble', name: 'appTitle', desc: '', args: []);
  }

  /// `Share Transport Feedback`
  String get shareTransportFeedback {
    return Intl.message(
      'Share Transport Feedback',
      name: 'shareTransportFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Transport Feedback`
  String get transportFeedback {
    return Intl.message(
      'Transport Feedback',
      name: 'transportFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Feedback Submitted`
  String get feedbackSubmittedTitle {
    return Intl.message(
      'Feedback Submitted',
      name: 'feedbackSubmittedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your feedback!`
  String get feedbackSubmittedContent {
    return Intl.message(
      'Thank you for your feedback!',
      name: 'feedbackSubmittedContent',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Email`
  String get emailLabel {
    return Intl.message('Email', name: 'emailLabel', desc: '', args: []);
  }

  /// `You have pushed the button this many times:`
  String get pushButtonText {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'pushButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Nearby`
  String get nearby {
    return Intl.message('Nearby', name: 'nearby', desc: '', args: []);
  }

  /// `Location services are disabled.`
  String get locationServicesDisabled {
    return Intl.message(
      'Location services are disabled.',
      name: 'locationServicesDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permission denied.`
  String get locationPermissionDenied {
    return Intl.message(
      'Location permission denied.',
      name: 'locationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permission denied forever.`
  String get locationPermissionDeniedForever {
    return Intl.message(
      'Location permission denied forever.',
      name: 'locationPermissionDeniedForever',
      desc: '',
      args: [],
    );
  }

  /// `Departures`
  String get departures {
    return Intl.message('Departures', name: 'departures', desc: '', args: []);
  }

  /// `to`
  String get to {
    return Intl.message('to', name: 'to', desc: '', args: []);
  }

  /// `min`
  String get min {
    return Intl.message('min', name: 'min', desc: '', args: []);
  }

  /// `now`
  String get now {
    return Intl.message('now', name: 'now', desc: '', args: []);
  }

  /// `Board a bus nearby`
  String get departNearby {
    return Intl.message(
      'Board a bus nearby',
      name: 'departNearby',
      desc: '',
      args: [],
    );
  }

  /// `I am on the bus`
  String get onTheBus {
    return Intl.message(
      'I am on the bus',
      name: 'onTheBus',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Please enter an email address.`
  String get emailRequired {
    return Intl.message(
      'Please enter an email address.',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Token received and stored.`
  String get tokenReceived {
    return Intl.message(
      'Token received and stored.',
      name: 'tokenReceived',
      desc: '',
      args: [],
    );
  }

  /// `Token not received from server.`
  String get tokenNotReceived {
    return Intl.message(
      'Token not received from server.',
      name: 'tokenNotReceived',
      desc: '',
      args: [],
    );
  }

  /// `Failed to submit email: {error}`
  String submitEmailFailed(String error) {
    return Intl.message(
      'Failed to submit email: $error',
      name: 'submitEmailFailed',
      desc: 'Error message when email submission fails',
      args: [error],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
