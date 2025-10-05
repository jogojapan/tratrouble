// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("トラトラブル"),
    "departures": MessageLookupByLibrary.simpleMessage("出発"),
    "emailLabel": MessageLookupByLibrary.simpleMessage("メール"),
    "feedbackSubmittedContent": MessageLookupByLibrary.simpleMessage(
      "フィードバックありがとうございます！",
    ),
    "feedbackSubmittedTitle": MessageLookupByLibrary.simpleMessage(
      "フィードバックが送信されました",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "位置情報の許可が拒否されました。",
    ),
    "locationPermissionDeniedForever": MessageLookupByLibrary.simpleMessage(
      "位置情報の許可が永久に拒否されました。",
    ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "位置情報サービスが無効になっています。",
    ),
    "min": MessageLookupByLibrary.simpleMessage("分"),
    "nearby": MessageLookupByLibrary.simpleMessage("近く"),
    "now": MessageLookupByLibrary.simpleMessage("今"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "shareTransportFeedback": MessageLookupByLibrary.simpleMessage(
      "輸送フィードバックを共有する",
    ),
    "to": MessageLookupByLibrary.simpleMessage("行き先"),
    "transportFeedback": MessageLookupByLibrary.simpleMessage("輸送フィードバック"),
  };
}
