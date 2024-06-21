import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageDropdownButton {
  static void Function(String)? localeSetter;
  static void setLocaleSetter(void Function(String) func) { localeSetter = func; }

  String? preferdLanguage = 'ja';
  String? defaultLanguage = 'en';
  String? selectedLanguage = null;

  LanguageDropdownButton() {
    this.selectedLanguage = this.preferdLanguage==null ? this.defaultLanguage : this.preferdLanguage;
  }

  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return DropdownButton(
          items: [
            DropdownMenuItem(
              value: 'en',
              child: Text(AppLocalizations.of(context)!.english),
            ),
            DropdownMenuItem(
              value: 'ja',
              child: Text(AppLocalizations.of(context)!.japanese),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text(AppLocalizations.of(context)!.arabic),
            ),
          ],
          value: selectedLanguage,
          onChanged: (String? value) {
            setState(() {
              selectedLanguage = value!;
              localeSetter?.call(selectedLanguage!);
            });
          },
        );
      },
    );
  }
}
