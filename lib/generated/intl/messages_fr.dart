// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(error) => "Erreur de lien profond : ${error}";

  static String m1(error) => "Échec de la soumission de l\'e-mail : ${error}";

  static String m2(error) => "Erreur de vérification : ${error}";

  static String m3(error) => "Vérification échouée : ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("TraTrouble"),
    "deepLinkError": m0,
    "departNearby": MessageLookupByLibrary.simpleMessage(
      "Monter dans un bus à proximité",
    ),
    "departures": MessageLookupByLibrary.simpleMessage("Départs"),
    "email": MessageLookupByLibrary.simpleMessage("E-mail"),
    "emailAlreadyVerified": MessageLookupByLibrary.simpleMessage(
      "E-mail déjà vérifié.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("E-mail"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer une adresse e-mail.",
    ),
    "emailVerifiedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "E-mail vérifié avec succès !",
    ),
    "feedbackSubmittedContent": MessageLookupByLibrary.simpleMessage(
      "Merci pour vos commentaires !",
    ),
    "feedbackSubmittedTitle": MessageLookupByLibrary.simpleMessage(
      "Retour envoyé",
    ),
    "iAmOnThisBus": MessageLookupByLibrary.simpleMessage("Je suis dans ce bus"),
    "iAmOnThisTrain": MessageLookupByLibrary.simpleMessage(
      "Je suis dans ce train",
    ),
    "iAmOnThisTram": MessageLookupByLibrary.simpleMessage(
      "Je suis dans ce tramway",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Permission de localisation refusée.",
    ),
    "locationPermissionDeniedForever": MessageLookupByLibrary.simpleMessage(
      "Permission de localisation refusée définitivement.",
    ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "Les services de localisation sont désactivés.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Connexion"),
    "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
    "min": MessageLookupByLibrary.simpleMessage("min"),
    "nearby": MessageLookupByLibrary.simpleMessage("À proximité"),
    "now": MessageLookupByLibrary.simpleMessage("maintenant"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "onTheBus": MessageLookupByLibrary.simpleMessage("Je suis dans le bus"),
    "shareTransportFeedback": MessageLookupByLibrary.simpleMessage(
      "Partager les commentaires sur le transport",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Soumettre"),
    "submitEmailFailed": m1,
    "submitEmailSuccess": MessageLookupByLibrary.simpleMessage(
      "Email envoyé. Vérifiez votre email.",
    ),
    "to": MessageLookupByLibrary.simpleMessage("à"),
    "tokenNotReceived": MessageLookupByLibrary.simpleMessage(
      "Jeton non reçu du serveur.",
    ),
    "tokenStored": MessageLookupByLibrary.simpleMessage(
      "Jeton stocké avec succès.",
    ),
    "transportFeedback": MessageLookupByLibrary.simpleMessage(
      "Commentaires sur le transport",
    ),
    "verificationError": m2,
    "verificationFailed": m3,
    "verificationLinkExpired": MessageLookupByLibrary.simpleMessage(
      "Le lien de vérification a expiré. Veuillez en demander un nouveau.",
    ),
  };
}
