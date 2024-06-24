import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;
import './main_screen.dart';
import './language_dropdown_button.dart';
import './settings.dart';

void main() {
  runApp(Alexandrite());
}

class AppBuilder extends StatefulWidget {
  final Function(BuildContext)? builder;
  const AppBuilder({super.key, this.builder});

  @override
  AppBuilderState createState() => new AppBuilderState();

  static AppBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>();
  }
}

class AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder!(context);
  }

  void rebuild() {
    setState(() {});
  }
}

class Alexandrite extends StatefulWidget {
  const Alexandrite({super.key});
  @override
  State<Alexandrite> createState() => _AlexandriteState();
}

class _AlexandriteState extends State<Alexandrite> {
  static Locale? currentLocale = null;
  static Locale? configuredLocale = null;

  void setLocale(Locale l, [bool b = false]) {
    if (isSupportecLocale(l)) {
      setState(() {
        currentLocale = l;
      });
      if (b) { Settings.setLocale(l); }
    }
  }

  void setDefaultLocale() async {
    configuredLocale = await Settings.getLocale();
    Locale? locale = null;
    if (isSupportecLocale(configuredLocale)) {
      var i = AppLocalizations.supportedLocales.indexOf(configuredLocale!);
      locale = AppLocalizations.supportedLocales[i];
    } else if (isSupportecLocale(ui.window.locale)) {
      var i = AppLocalizations.supportedLocales.indexOf(ui.window.locale);
      locale = AppLocalizations.supportedLocales[i];
    } else {
      locale = AppLocalizations.supportedLocales.first;
    }
    setLocale(locale);
  }

  bool isSupportecLocale(Locale? l) {
    if (l!=null) {
      for (var sl in AppLocalizations.supportedLocales) {
        if (l==sl) { return true; }
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    LanguageDropdownButton.setLocaleSetter(setLocale);
    setDefaultLocale();
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (BuildContext context) {
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
        locale: currentLocale,
        home: MainScreen(),
      );
   });
  }
}

