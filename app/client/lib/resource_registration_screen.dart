/****************************************************************
 * resource_registration_screen.dart
 * A screen to add resource.
 ****************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './admin_screen.dart';
import './admin_appbar.dart';
import './admin_drawer.dart';
import './resource_registration_resource.dart';

/****************
 * ResourceRegistrationScreen
 * Displays a screen to add resource.
 ****************/
class ResourceRegistrationScreen extends StatelessWidget {
  String id = "";
  final TextEditingController controller = TextEditingController();
  List<Widget> widgets = [];
  var resource = ResourceRegistrationResource();

  /****
   * refresh()
   * A callback function be called when selected resources changed.
   ****/
  void refresh() {
    setState(() {
      widgets = resource.asListOfWidget();
    });
  }

  /****
   * flush()
   * Delete all information of result.
   * It is assumed used when canceled selection.
   ****/
  void flush() {
    setState(() {
      widgets = [];
      resource = ResourceRegistrationResource();
    });
  }

  /****
   * initState()
   * Runs initialization process.
   * This can deal with properties and can call functions like a constructor.
   ****/
  @override
  void initState() {
    super.initState();
    ResourceRegistrationResource.setCallbackFunction(refresh);
  }

  /***
   * build()
   * Retruns widget of this class.
   ***/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(context),
      appBar: AdminAppBar(context),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      id = value;
                    },
                    controller: controller,
                  ),
                ),
                MaterialButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    print("add!");
                    resource.add(id);
                    id = "";
                    controller.clear();
                  },
                ),
              ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
            MaterialButton(
              child: Text(AppLocalizations.of(context)!.register),
              onPressed: () {
                print("register!");
                flush();
              },
            ),
            MaterialButton(
              child: Text(AppLocalizations.of(context)!.back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]
        )
      ),
    );
  }
}
