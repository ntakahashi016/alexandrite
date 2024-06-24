import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static const String localeKey = "locale";

  static Future<void> setLocale(Locale l) async {
    final storage = await SharedPreferences.getInstance();
    String value = l.languageCode;
    if (l.scriptCode != null) { value += "_${l.scriptCode}";}
    if (l.countryCode != null) { value += "_${l.countryCode}";}
    storage.setString(localeKey, value);
  }

  static Future<Locale?> getLocale() async {
    final storage = await SharedPreferences.getInstance();
    String? value = storage.getString(localeKey);
    if (value == null) { return null; }
    final re = RegExp(r'(?<lang>[a-z]+)(_(?<script>[A-Z][a-z]+))?(_(?<country>[A-Z]{2,}))?$');
    final matches = re.allMatches(value).toList();
    var match = matches[0];
    return Locale.fromSubtags(
      languageCode: match.namedGroup('lang')!,
      scriptCode: match.namedGroup('script'),
      countryCode: match.namedGroup('country'),
    );
  }
}
