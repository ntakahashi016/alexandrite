import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './menu_item.dart';
import './admin_screen.dart';
import './wip_screen.dart';

class MainDrawer extends Drawer {
  MainDrawer(BuildContext context) : super(
    child: Column(
      children: [
        MaterialButton(
          child: Row(
            children: [
              Icon(Icons.settings_applications, size: 28.0),
              Text(AppLocalizations.of(context)!.admin_screen, style: TextStyle( fontSize: 28.0 )),
            ]
          ),
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen()))},
        ),
      ]
    ),
  ) {}
}
