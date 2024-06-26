/****************************************************************
 * language_dropdown_button.dart
 * Be able to select the locale dynamically.
 ****************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './main.dart';

/****************
 * LanguageDropdownButton
 * Be able to selec the locale dynamically.
 ****************/
class LanguageDropdownButton extends StatefulWidget {
  LanguageDropdownButton({super.key});
  static void Function(Locale, bool)? localeSetter;

  /****
   * setLocaleSetter()
   * Set callback function to set locale.
   ****/
  static void setLocaleSetter(void Function(Locale, bool) l) {localeSetter = l;}

  /****
   * createState()
   * Creates instance of State
   ****/
  @override
  State<LanguageDropdownButton> createState() => _LanguageDropdownButton();
}

/****************
 * _LanguageDropdownButton
 * Holds the state of LanguageDropdownButton.
 ****************/
class _LanguageDropdownButton extends State<LanguageDropdownButton> {
  static Locale? currentLocale = null;
  static String? currentLanguage = null;
  static Map<String, Locale> codeToLocaleMap = {
    AppLocalizations.supportedLocales[1].languageCode : AppLocalizations.supportedLocales[1],
    AppLocalizations.supportedLocales[2].languageCode : AppLocalizations.supportedLocales[2],
    AppLocalizations.supportedLocales[0].languageCode : AppLocalizations.supportedLocales[0],
  };

  /***
   * build()
   * Retruns widget of this class.
   ***/
  @override
  Widget build(BuildContext context) {
    Map<Locale, String> localeToLanguageMap = {
      AppLocalizations.supportedLocales[1] : AppLocalizations.of(context)!.english,
      AppLocalizations.supportedLocales[2] : AppLocalizations.of(context)!.japanese,
      AppLocalizations.supportedLocales[0] : AppLocalizations.of(context)!.arabic,
    };
    List<DropdownMenuItem> items = List.generate(AppLocalizations.supportedLocales.length, (index) {
      Locale l = AppLocalizations.supportedLocales[index];
      return DropdownMenuItem(
        value: l.languageCode,
        child: Text(localeToLanguageMap[l]!),
      );
    });
    currentLocale = Localizations.localeOf(context);
    currentLanguage = currentLocale!.languageCode;
    return DropdownButton(
      items: items,
      value: currentLanguage,
      onChanged: (dynamic value) {
        setState(() {
          currentLanguage = value!;
          currentLocale = codeToLocaleMap[value!];
          TextDirection oldDirection = Directionality.of(context);
          LanguageDropdownButton.localeSetter?.call(currentLocale!, true);
          if (Directionality.of(context) != oldDirection) { AppBuilder.of(context)!.rebuild(); }
        });
      },
    );
  }
}
