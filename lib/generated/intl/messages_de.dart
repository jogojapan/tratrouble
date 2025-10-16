// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(error) => "E-Mail-Versand fehlgeschlagen: ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("TraTrouble"),
    "departNearby": MessageLookupByLibrary.simpleMessage(
      "Steigen Sie in einen Bus in der Nähe ein",
    ),
    "departures": MessageLookupByLibrary.simpleMessage("Abfahrten"),
    "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "emailLabel": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie eine E-Mail-Adresse ein.",
    ),
    "feedbackSubmittedContent": MessageLookupByLibrary.simpleMessage(
      "Vielen Dank für Ihr Feedback!",
    ),
    "feedbackSubmittedTitle": MessageLookupByLibrary.simpleMessage(
      "Feedback gesendet",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Ortungsberechtigung verweigert.",
    ),
    "locationPermissionDeniedForever": MessageLookupByLibrary.simpleMessage(
      "Ortungsberechtigung dauerhaft verweigert.",
    ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "Ortungsdienste sind deaktiviert.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Anmelden"),
    "min": MessageLookupByLibrary.simpleMessage("Min"),
    "nearby": MessageLookupByLibrary.simpleMessage("In der Nähe"),
    "now": MessageLookupByLibrary.simpleMessage("jetzt"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "onTheBus": MessageLookupByLibrary.simpleMessage("Ich bin im Bus"),
    "pushButtonText": MessageLookupByLibrary.simpleMessage(
      "Sie haben den Knopf so oft gedrückt:",
    ),
    "shareTransportFeedback": MessageLookupByLibrary.simpleMessage(
      "Teilen Sie Transportfeedback",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Senden"),
    "submitEmailFailed": m0,
    "to": MessageLookupByLibrary.simpleMessage("bis"),
    "tokenNotReceived": MessageLookupByLibrary.simpleMessage(
      "Token nicht vom Server empfangen.",
    ),
    "tokenReceived": MessageLookupByLibrary.simpleMessage(
      "Token empfangen und gespeichert.",
    ),
    "transportFeedback": MessageLookupByLibrary.simpleMessage(
      "Transportfeedback",
    ),
  };
}
