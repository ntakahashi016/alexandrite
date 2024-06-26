import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './menu_item.dart';
import './admin_screen.dart';
import './language_dropdown_button.dart';

class AdminAppBar extends AppBar{
  AdminAppBar(context) : super(
    title: Row(
      children: [
        MaterialButton(
          child: Row(
            children: [
              Icon(Icons.settings_applications, size: 28.0),
              Text(AppLocalizations.of(context)!.admin_title, style: TextStyle( fontSize: 28.0 )),
            ]
          ),
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen()))},
        ),
        LanguageDropdownButton(),
      ],
    ),
  ) {}
}
