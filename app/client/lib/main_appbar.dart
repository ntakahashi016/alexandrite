/****************************************************************
 * main_appbar.dart
 * A part of screens for user.
 ****************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './menu_item.dart';
import './main_screen.dart';
import './language_dropdown_button.dart';

/****************
 * MainAppBar
 * A customized AppBar for users.
 ****************/
class MainAppBar extends AppBar {

  /****
   * constructor
   * Returns widget of this class.
   ****/
  MainAppBar(BuildContext context) : super(
    title: Row(
      children: [
        MaterialButton(
          child: Row(
            children: [
              Icon(Icons.import_contacts, size: 28.0),
              Text(AppLocalizations.of(context)!.main_title, style: TextStyle( fontSize: 28.0 )),
            ]
          ),
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()))},
        ),
        LanguageDropdownButton(),
      ],
    ),
  ) {}
}
