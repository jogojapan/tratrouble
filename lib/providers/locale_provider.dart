import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  static const String _localeKey = 'locale';
  Locale _locale = const Locale('en');

  LocaleProvider() {
    _loadLocale();
  }

  Locale get locale => _locale;

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeString = prefs.getString(_localeKey);
    if (localeString != null && localeString.isNotEmpty) {
      _locale = Locale(localeString);
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (!['en', 'de', 'fr', 'ja'].contains(locale.languageCode)) return;
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    notifyListeners();
  }

  Future<void> clearLocale() async {
    _locale = const Locale('en');
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);
    notifyListeners();
  }
}
