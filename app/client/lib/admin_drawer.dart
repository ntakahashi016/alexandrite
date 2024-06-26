/****************************************************************
 * admin_drawer.dart
 * A part of screens for administrator.
 ****************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './menu_item.dart';
import './main_screen.dart';
import './wip_screen.dart';

/****************
 * AdminDrawer
 * A customized Drawer for administrator.
 ****************/
class AdminDrawer extends Drawer {

  /****
   * constructor
   * Returns Drawer customized for administrator.
   ****/
  AdminDrawer(BuildContext context) : super(
    child: Column(
      children: [
        MaterialButton(
          child: Row(
            children: [
              Icon(Icons.import_contacts, size: 28.0),
              Text(AppLocalizations.of(context)!.main_screen, style: TextStyle( fontSize: 28.0 )),
            ]
          ),
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()))},
        ),
      ]
    ),
  ) {}
}
