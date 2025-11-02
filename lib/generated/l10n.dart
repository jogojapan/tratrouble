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

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
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

  /// `Registration submitted. Check your email.`
  String get submitEmailSuccess {
    return Intl.message(
      'Registration submitted. Check your email.',
      name: 'submitEmailSuccess',
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

  /// `Email verified successfully!`
  String get emailVerifiedSuccessfully {
    return Intl.message(
      'Email verified successfully!',
      name: 'emailVerifiedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed: {error}`
  String verificationFailed(String error) {
    return Intl.message(
      'Verification failed: $error',
      name: 'verificationFailed',
      desc: 'Error message when email verification fails',
      args: [error],
    );
  }

  /// `Verification error: {error}`
  String verificationError(String error) {
    return Intl.message(
      'Verification error: $error',
      name: 'verificationError',
      desc: 'Error message when email verification encounters an error',
      args: [error],
    );
  }

  /// `Deep link error: {error}`
  String deepLinkError(String error) {
    return Intl.message(
      'Deep link error: $error',
      name: 'deepLinkError',
      desc: 'Error message when processing a deep link fails',
      args: [error],
    );
  }

  /// `Email already verified.`
  String get emailAlreadyVerified {
    return Intl.message(
      'Email already verified.',
      name: 'emailAlreadyVerified',
      desc: '',
      args: [],
    );
  }

  /// `Verification link has expired. Please request a new one.`
  String get verificationLinkExpired {
    return Intl.message(
      'Verification link has expired. Please request a new one.',
      name: 'verificationLinkExpired',
      desc: '',
      args: [],
    );
  }

  /// `Token stored successfully.`
  String get tokenStored {
    return Intl.message(
      'Token stored successfully.',
      name: 'tokenStored',
      desc: '',
      args: [],
    );
  }

  /// `I am on this bus`
  String get iAmOnThisBus {
    return Intl.message(
      'I am on this bus',
      name: 'iAmOnThisBus',
      desc: '',
      args: [],
    );
  }

  /// `I am on this train`
  String get iAmOnThisTrain {
    return Intl.message(
      'I am on this train',
      name: 'iAmOnThisTrain',
      desc: '',
      args: [],
    );
  }

  /// `I am on this tram`
  String get iAmOnThisTram {
    return Intl.message(
      'I am on this tram',
      name: 'iAmOnThisTram',
      desc: '',
      args: [],
    );
  }

  /// `Ride Feedback`
  String get rideFeedback {
    return Intl.message(
      'Ride Feedback',
      name: 'rideFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Punctuality`
  String get punctuality {
    return Intl.message('Punctuality', name: 'punctuality', desc: '', args: []);
  }

  /// `On time`
  String get onTime {
    return Intl.message('On time', name: 'onTime', desc: '', args: []);
  }

  /// `1-2 min late`
  String get late1to2Min {
    return Intl.message(
      '1-2 min late',
      name: 'late1to2Min',
      desc: '',
      args: [],
    );
  }

  /// `>2 min late`
  String get lateMoreThan2Min {
    return Intl.message(
      '>2 min late',
      name: 'lateMoreThan2Min',
      desc: '',
      args: [],
    );
  }

  /// `Departed 1-2 min too early`
  String get earlyDeparture1to2Min {
    return Intl.message(
      'Departed 1-2 min too early',
      name: 'earlyDeparture1to2Min',
      desc: '',
      args: [],
    );
  }

  /// `Departed >2 min early`
  String get earlyDepartureMoreThan2Min {
    return Intl.message(
      'Departed >2 min early',
      name: 'earlyDepartureMoreThan2Min',
      desc: '',
      args: [],
    );
  }

  /// `Onboard info display`
  String get onboardInfoDisplay {
    return Intl.message(
      'Onboard info display',
      name: 'onboardInfoDisplay',
      desc: '',
      args: [],
    );
  }

  /// `Display functional`
  String get displayFunctional {
    return Intl.message(
      'Display functional',
      name: 'displayFunctional',
      desc: '',
      args: [],
    );
  }

  /// `Display broken`
  String get displayBroken {
    return Intl.message(
      'Display broken',
      name: 'displayBroken',
      desc: '',
      args: [],
    );
  }

  /// `Display non-existing`
  String get displayNonExisting {
    return Intl.message(
      'Display non-existing',
      name: 'displayNonExisting',
      desc: '',
      args: [],
    );
  }

  /// `Onboard announcements`
  String get onboardAnnouncements {
    return Intl.message(
      'Onboard announcements',
      name: 'onboardAnnouncements',
      desc: '',
      args: [],
    );
  }

  /// `Clear announcements`
  String get clearAnnouncements {
    return Intl.message(
      'Clear announcements',
      name: 'clearAnnouncements',
      desc: '',
      args: [],
    );
  }

  /// `Unclear announcements`
  String get unclearAnnouncements {
    return Intl.message(
      'Unclear announcements',
      name: 'unclearAnnouncements',
      desc: '',
      args: [],
    );
  }

  /// `No announcements`
  String get noAnnouncements {
    return Intl.message(
      'No announcements',
      name: 'noAnnouncements',
      desc: '',
      args: [],
    );
  }

  /// `Capacity`
  String get capacity {
    return Intl.message('Capacity', name: 'capacity', desc: '', args: []);
  }

  /// `I got a seat`
  String get gotASeat {
    return Intl.message('I got a seat', name: 'gotASeat', desc: '', args: []);
  }

  /// `I could stand comfortably`
  String get couldStandComfortably {
    return Intl.message(
      'I could stand comfortably',
      name: 'couldStandComfortably',
      desc: '',
      args: [],
    );
  }

  /// `Overcrowded`
  String get overcrowded {
    return Intl.message('Overcrowded', name: 'overcrowded', desc: '', args: []);
  }

  /// `Driving style`
  String get drivingStyle {
    return Intl.message(
      'Driving style',
      name: 'drivingStyle',
      desc: '',
      args: [],
    );
  }

  /// `Safe driving`
  String get safeDriving {
    return Intl.message(
      'Safe driving',
      name: 'safeDriving',
      desc: '',
      args: [],
    );
  }

  /// `Rough driving`
  String get roughDriving {
    return Intl.message(
      'Rough driving',
      name: 'roughDriving',
      desc: '',
      args: [],
    );
  }

  /// `So rough that somebody fell`
  String get soRoughSomebodyFell {
    return Intl.message(
      'So rough that somebody fell',
      name: 'soRoughSomebodyFell',
      desc: '',
      args: [],
    );
  }

  /// `Cleanliness`
  String get cleanliness {
    return Intl.message('Cleanliness', name: 'cleanliness', desc: '', args: []);
  }

  /// `Greasy surfaces`
  String get greasySurfaces {
    return Intl.message(
      'Greasy surfaces',
      name: 'greasySurfaces',
      desc: '',
      args: [],
    );
  }

  /// `Some garbage`
  String get someGarbage {
    return Intl.message(
      'Some garbage',
      name: 'someGarbage',
      desc: '',
      args: [],
    );
  }

  /// `Lots of garbage`
  String get lotsOfGarbage {
    return Intl.message(
      'Lots of garbage',
      name: 'lotsOfGarbage',
      desc: '',
      args: [],
    );
  }

  /// `Liquid dirt or vomit`
  String get liquidDirtOrVomit {
    return Intl.message(
      'Liquid dirt or vomit',
      name: 'liquidDirtOrVomit',
      desc: '',
      args: [],
    );
  }

  /// `Smelly`
  String get smelly {
    return Intl.message('Smelly', name: 'smelly', desc: '', args: []);
  }

  /// `Extreme smell`
  String get extremeSmell {
    return Intl.message(
      'Extreme smell',
      name: 'extremeSmell',
      desc: '',
      args: [],
    );
  }

  /// `No problems`
  String get noProblems {
    return Intl.message('No problems', name: 'noProblems', desc: '', args: []);
  }

  /// `Temperature`
  String get temperature {
    return Intl.message('Temperature', name: 'temperature', desc: '', args: []);
  }

  /// `Too warm`
  String get tooWarm {
    return Intl.message('Too warm', name: 'tooWarm', desc: '', args: []);
  }

  /// `Too cold`
  String get tooCold {
    return Intl.message('Too cold', name: 'tooCold', desc: '', args: []);
  }

  /// `OK`
  String get temperatureOk {
    return Intl.message('OK', name: 'temperatureOk', desc: '', args: []);
  }

  /// `Passenger behavior`
  String get passengerBehavior {
    return Intl.message(
      'Passenger behavior',
      name: 'passengerBehavior',
      desc: '',
      args: [],
    );
  }

  /// `Aggressive behavior`
  String get aggressiveBehavior {
    return Intl.message(
      'Aggressive behavior',
      name: 'aggressiveBehavior',
      desc: '',
      args: [],
    );
  }

  /// `Drunk person`
  String get drunkPerson {
    return Intl.message(
      'Drunk person',
      name: 'drunkPerson',
      desc: '',
      args: [],
    );
  }

  /// `Additional comments (optional)`
  String get additionalComments {
    return Intl.message(
      'Additional comments (optional)',
      name: 'additionalComments',
      desc: '',
      args: [],
    );
  }

  /// `Submit Feedback`
  String get submitFeedback {
    return Intl.message(
      'Submit Feedback',
      name: 'submitFeedback',
      desc: '',
      args: [],
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
