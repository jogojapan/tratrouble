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

  static String m0(error) => "Deep-Link-Fehler: ${error}";

  static String m1(error) => "E-Mail-Versand fehlgeschlagen: ${error}";

  static String m2(error) => "Verifizierungsfehler: ${error}";

  static String m3(error) => "Verifizierung fehlgeschlagen: ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("TraTrouble"),
    "deepLinkError": m0,
    "departNearby": MessageLookupByLibrary.simpleMessage(
      "Demnächst in der Nähe einsteigen",
    ),
    "departures": MessageLookupByLibrary.simpleMessage("Abfahrten"),
    "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "emailAlreadyVerified": MessageLookupByLibrary.simpleMessage(
      "E-Mail bereits verifiziert.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie eine E-Mail-Adresse ein.",
    ),
    "emailVerifiedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "E-Mail erfolgreich verifiziert!",
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
    "logout": MessageLookupByLibrary.simpleMessage("Abmelden"),
    "min": MessageLookupByLibrary.simpleMessage("Min"),
    "nearby": MessageLookupByLibrary.simpleMessage("In der Nähe"),
    "now": MessageLookupByLibrary.simpleMessage("jetzt"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "onTheBus": MessageLookupByLibrary.simpleMessage("Ich bin im Bus"),
    "shareTransportFeedback": MessageLookupByLibrary.simpleMessage(
      "Teilen Sie Transportfeedback",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Senden"),
    "submitEmailFailed": m1,
    "submitEmailSuccess": MessageLookupByLibrary.simpleMessage(
      "Email wird verschickt. Bitte Email checken.",
    ),
    "to": MessageLookupByLibrary.simpleMessage("bis"),
    "tokenNotReceived": MessageLookupByLibrary.simpleMessage(
      "Token nicht vom Server empfangen.",
    ),
    "tokenStored": MessageLookupByLibrary.simpleMessage(
      "Token erfolgreich gespeichert.",
    ),
    "transportFeedback": MessageLookupByLibrary.simpleMessage(
      "Transportfeedback",
    ),
    "verificationError": m2,
    "verificationFailed": m3,
    "verificationLinkExpired": MessageLookupByLibrary.simpleMessage(
      "Verifizierungslink ist abgelaufen. Bitte fordern Sie einen neuen an.",
    ),
  };
}
