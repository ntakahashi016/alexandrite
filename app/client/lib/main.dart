/****************************************************************
 * main.dart
 * Specifies the state management and rebuilding of the entire application.
 ****************************************************************/
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;
import './main_screen.dart';
import './language_dropdown_button.dart';
import './settings.dart';

/***
 * main()
 * A entrypoint of application.
 ***/
void main() {
  runApp(Alexandrite());
}

/****************
 * AppBuilder
 * A wrapper class to be able to rebuild entire application.
 ****************/
class AppBuilder extends StatefulWidget {
  final Function(BuildContext)? builder;
  const AppBuilder({super.key, this.builder});

  /***
   * createState()
   * Creates instance of State of this class.
   ***/
  @override
  AppBuilderState createState() => new AppBuilderState();

  /***
   * of()
   * Retruns nearest ancestor AppBuilderState widget.
   ***/
  static AppBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>();
  }
}

/****************
 * AppBUilderState
 * Holds the state of AppBUilder.
 ****************/
class AppBuilderState extends State<AppBuilder> {

  /***
   * build()
   * Retruns widget of this class.
   ***/
  @override
  Widget build(BuildContext context) {
    return widget.builder!(context);
  }

  /***
   * rebuild()
   * Called to rebuild entire application.
   ***/
  void rebuild() {
    setState(() {});
  }
}

/****************
 * Alexandrite
 * The application itself.
 ****************/
class Alexandrite extends StatefulWidget {
  const Alexandrite({super.key});

  /***
   * createState()
   * Creates instance of State of this class.
   ***/
  @override
  State<Alexandrite> createState() => _AlexandriteState();
}

/****************
 * _AlexandriteState
 * Holds the state of Alexandrite.
 ****************/
class _AlexandriteState extends State<Alexandrite> {
  static Locale? currentLocale = null;    // Actually displayed locale.
  static Locale? configuredLocale = null; // A value loaded from configuration file.

  /***
   * setLocale()
   * A setter of currentLocale.
   * It can be turned on/off by boolian argument.
   ***/
  void setLocale(Locale l, [bool b = false]) {
    if (isSupportecLocale(l)) {
      setState(() {
        currentLocale = l;
      });
      if (b) { Settings.setLocale(l); }
    }
  }

  /***
   * setDefaultLocale()
   * Resolves what locale should be set when the application started.
   * This should called at only once when the application started.
   ***/
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

  /***
   * isSupportedLocale()
   * Returns true when provided locale is included the suppported list.
   ***/
  bool isSupportecLocale(Locale? l) {
    if (l!=null) {
      for (var sl in AppLocalizations.supportedLocales) {
        if (l==sl) { return true; }
      }
    }
    return false;
  }

  /***
   * initState()
   * Runs initialization process.
   * This can deal with properties and can call functions like a constructor.
   ***/
  @override
  void initState() {
    super.initState();
    LanguageDropdownButton.setLocaleSetter(setLocale);
    setDefaultLocale();
  }

  /***
   * build()
   * Retruns widget of this class.
   ***/
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

