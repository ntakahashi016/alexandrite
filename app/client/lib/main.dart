import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;
import './main_screen.dart';

void main() {
  runApp(Alexandrite());
}

class Alexandrite extends StatefulWidget {
  const Alexandrite({super.key});
  @override
  State<Alexandrite> createState() => _AlexandriteState();
}

class _AlexandriteState extends State<Alexandrite> {
  void setLocale(String l) {
    setState(() {
      localeString = l;
    });
    print(Locale(localeString));
  }

  String localeString = 'en';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alexandrite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), //English
        Locale('ja', ''), //Japanese
        Locale('ar', ''), //Arabic
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        final currentLocale = ui.window.locale;
        if (locales == null) {
          return AppLocalizations.supportedLocales.first;
        }
        for (var l in supportedLocales) {
          if (localeString == l.languageCode) {
            return l;
          }
        }
        for (var l in supportedLocales) {
          if (currentLocale.languageCode == l.languageCode) {
            return l;
          }
        }
        return AppLocalizations.supportedLocales.first;
      },
      locale: Locale(localeString),
      home: MainScreen(localeSetter: setLocale),
    );
  }
}

