/****************************************************************
 * wip_screen.dart
 * A screen work in progress.
 ****************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './main_appbar.dart';
import './main_drawer.dart';

/****************
 * WipScreen
 * Displays a screen work in progress.
 ****************/
class WipScreen extends StatelessWidget {

  /***
   * build()
   * Retruns widget of this class.
   ***/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(context),
      appBar: MainAppBar(context),
      body: Center(
        child: MaterialButton(
          child: Text(AppLocalizations.of(context)!.back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
    );
  }
}
