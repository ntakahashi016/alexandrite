import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './admin_appbar.dart';
import './admin_drawer.dart';
import './menu_item.dart';
import './resource_registration_screen.dart';
import './user_registration_screen.dart';
import './wip_screen.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(context),
      appBar: AdminAppBar(context),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.77,
        shrinkWrap: true,
        children: [
          ButtonTheme(
            child: MaterialButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegistrationScreen()))},
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_add, size: 28.0),
                  Text(AppLocalizations.of(context)!.user_registration, style: TextStyle( fontSize: 28.0)),
                ],
              ),
            ),
          ),
          ButtonTheme(
            child: MaterialButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => ResourceRegistrationScreen()))},
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_box, size: 28.0),
                  Text(AppLocalizations.of(context)!.resource_registration, style: TextStyle( fontSize: 28.0)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
