import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/auth_provider.dart';
import '../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();
    await authProvider.logout();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    final isDark = themeProvider.isDarkMode;
    final textColor = isDark ? Colors.grey[300] : Colors.black;

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).appTitle)),
      body: ListView(
        children: [
          if (authProvider.isLoggedIn)
            ListTile(
              title: Text(
                S.of(context).logout,
                style: TextStyle(color: textColor),
              ),
              trailing: Icon(Icons.logout, color: textColor),
              onTap: () => _logout(context),
            ),
          if (authProvider.isLoggedIn) const Divider(),
          ListTile(
            title: Text('English', style: TextStyle(color: textColor)),
            trailing: localeProvider.locale.languageCode == 'en'
                ? Icon(Icons.check, color: textColor)
                : null,
            onTap: () => localeProvider.setLocale(const Locale('en')),
          ),
          ListTile(
            title: Text('Deutsch', style: TextStyle(color: textColor)),
            trailing: localeProvider.locale.languageCode == 'de'
                ? Icon(Icons.check, color: textColor)
                : null,
            onTap: () => localeProvider.setLocale(const Locale('de')),
          ),
          ListTile(
            title: Text('Français', style: TextStyle(color: textColor)),
            trailing: localeProvider.locale.languageCode == 'fr'
                ? Icon(Icons.check, color: textColor)
                : null,
            onTap: () => localeProvider.setLocale(const Locale('fr')),
          ),
          ListTile(
            title: Text('日本語', style: TextStyle(color: textColor)),
            trailing: localeProvider.locale.languageCode == 'ja'
                ? Icon(Icons.check, color: textColor)
                : null,
            onTap: () => localeProvider.setLocale(const Locale('ja')),
          ),
          const Divider(),
          ListTile(
            title: Text('Light Theme', style: TextStyle(color: textColor)),
            trailing: themeProvider.themeMode == ThemeMode.light
                ? Icon(Icons.check, color: textColor)
                : null,
            onTap: () => themeProvider.setTheme(ThemeMode.light),
          ),
          ListTile(
            title: Text('Dark Theme', style: TextStyle(color: textColor)),
            trailing: themeProvider.themeMode == ThemeMode.dark
                ? Icon(Icons.check, color: textColor)
                : null,
            onTap: () => themeProvider.setTheme(ThemeMode.dark),
          ),
          ListTile(
            title: Text('System Default', style: TextStyle(color: textColor)),
            trailing: themeProvider.themeMode == ThemeMode.system
                ? Icon(Icons.check, color: textColor)
                : null,
            onTap: () => themeProvider.setTheme(ThemeMode.system),
          ),
        ],
      ),
    );
  }
}
