// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(error) => "Deep link error: ${error}";

  static String m1(error) => "Failed to submit email: ${error}";

  static String m2(error) => "Verification error: ${error}";

  static String m3(error) => "Verification failed: ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("TraTrouble"),
    "deepLinkError": m0,
    "departNearby": MessageLookupByLibrary.simpleMessage("Board a bus nearby"),
    "departures": MessageLookupByLibrary.simpleMessage("Departures"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAlreadyVerified": MessageLookupByLibrary.simpleMessage(
      "Email already verified.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter an email address.",
    ),
    "emailVerifiedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Email verified successfully!",
    ),
    "feedbackSubmittedContent": MessageLookupByLibrary.simpleMessage(
      "Thank you for your feedback!",
    ),
    "feedbackSubmittedTitle": MessageLookupByLibrary.simpleMessage(
      "Feedback Submitted",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Location permission denied.",
    ),
    "locationPermissionDeniedForever": MessageLookupByLibrary.simpleMessage(
      "Location permission denied forever.",
    ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "Location services are disabled.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "min": MessageLookupByLibrary.simpleMessage("min"),
    "nearby": MessageLookupByLibrary.simpleMessage("Nearby"),
    "now": MessageLookupByLibrary.simpleMessage("now"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "onTheBus": MessageLookupByLibrary.simpleMessage("I am on the bus"),
    "pushButtonText": MessageLookupByLibrary.simpleMessage(
      "You have pushed the button this many times:",
    ),
    "shareTransportFeedback": MessageLookupByLibrary.simpleMessage(
      "Share Transport Feedback",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "submitEmailFailed": m1,
    "submitEmailSuccess": MessageLookupByLibrary.simpleMessage(
      "Registration submitted. Check your email.",
    ),
    "to": MessageLookupByLibrary.simpleMessage("to"),
    "tokenNotReceived": MessageLookupByLibrary.simpleMessage(
      "Token not received from server.",
    ),
    "tokenStored": MessageLookupByLibrary.simpleMessage(
      "Token stored successfully.",
    ),
    "transportFeedback": MessageLookupByLibrary.simpleMessage(
      "Transport Feedback",
    ),
    "verificationError": m2,
    "verificationFailed": m3,
    "verificationLinkExpired": MessageLookupByLibrary.simpleMessage(
      "Verification link has expired. Please request a new one.",
    ),
  };
}
