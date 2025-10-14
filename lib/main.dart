import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/locale_provider.dart';
import 'screens/settings_screen.dart';
import 'screens/nearby_screen.dart';
import 'screens/on_bus_screen.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const TraTroubleApp());
}

class TraTroubleApp extends StatelessWidget {
  const TraTroubleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, child) {
          return MaterialApp(
            title: 'TraTrouble', // S.of(context).appTitle,
            theme: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlue,
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlue,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: themeProvider.themeMode,
            locale: localeProvider.locale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: Builder(
              builder: (context) =>
                  TraTroubleHome(title: S.of(context).appTitle),
            ),
          );
        },
      ),
    );
  }
}

class TraTroubleHome extends StatefulWidget {
  const TraTroubleHome({super.key, required this.title});

  final String title;

  @override
  State<TraTroubleHome> createState() => _TraTroubleHomeState();
}

class _TraTroubleHomeState extends State<TraTroubleHome> {
  void _navigateToSettings() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  void _navigateToNearby() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const NearbyScreen()));
  }

  void _navigateToOnBus() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const OnBusScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(S.of(context).appTitle),
            actions: [
              IconButton(
                icon: Icon(
                  themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: _navigateToSettings,
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _navigateToNearby,
                          child: Text(
                            S.of(context).departNearby,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _navigateToOnBus,
                          child: Text(
                            S.of(context).onTheBus,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
