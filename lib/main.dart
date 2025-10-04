import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/locale_provider.dart';
import 'screens/feedback_screen.dart';
import 'screens/settings_screen.dart';
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
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
            ),
            darkTheme: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 42;
    });
  }

  void _navigateToFeedback() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const FeedbackScreen()));
  }

  void _navigateToSettings() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

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
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                final isDark = themeProvider.isDarkMode;
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: isDark
                        ? Colors.blue[900]
                        : Colors.grey[300],
                    foregroundColor: isDark
                        ? Colors.grey[300]
                        : Colors.blue[900],
                  ),
                  onPressed: _navigateToFeedback,
                  child: Text(
                    S.of(context).shareTransportFeedback,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(S.of(context).pushButtonText),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
