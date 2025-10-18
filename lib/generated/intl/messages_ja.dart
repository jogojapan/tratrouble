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

  static String m0(error) => "ディープリンクエラー: ${error}";

  static String m1(error) => "メール送信に失敗しました: ${error}";

  static String m2(error) => "確認エラー: ${error}";

  static String m3(error) => "確認に失敗しました: ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("トラトラブル"),
    "deepLinkError": m0,
    "departNearby": MessageLookupByLibrary.simpleMessage("近くのバスに乗る"),
    "departures": MessageLookupByLibrary.simpleMessage("出発"),
    "email": MessageLookupByLibrary.simpleMessage("メール"),
    "emailAlreadyVerified": MessageLookupByLibrary.simpleMessage(
      "メールはすでに確認されています。",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("メール"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("メールアドレスを入力してください。"),
    "emailVerifiedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "メールが正常に確認されました！",
    ),
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
    "login": MessageLookupByLibrary.simpleMessage("ログイン"),
    "min": MessageLookupByLibrary.simpleMessage("分"),
    "nearby": MessageLookupByLibrary.simpleMessage("近く"),
    "now": MessageLookupByLibrary.simpleMessage("今"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "onTheBus": MessageLookupByLibrary.simpleMessage("既にバスに乗っています"),
    "pushButtonText": MessageLookupByLibrary.simpleMessage("ボタンを押した回数："),
    "shareTransportFeedback": MessageLookupByLibrary.simpleMessage(
      "輸送フィードバックを共有する",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("送信"),
    "submitEmailFailed": m1,
    "submitEmailSuccess": MessageLookupByLibrary.simpleMessage(
      "有難うございます。メールをご確認ください。",
    ),
    "to": MessageLookupByLibrary.simpleMessage("行き先"),
    "tokenStored": MessageLookupByLibrary.simpleMessage("トークンが正常に保存されました。"),
    "transportFeedback": MessageLookupByLibrary.simpleMessage("輸送フィードバック"),
    "verificationError": m2,
    "verificationFailed": m3,
    "verificationLinkExpired": MessageLookupByLibrary.simpleMessage(
      "確認リンクの有効期限が切れています。新しいリンクをリクエストしてください。",
    ),
  };
}
