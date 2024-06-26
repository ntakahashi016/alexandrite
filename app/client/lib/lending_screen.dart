/****************************************************************
 * lending_screen.dart
 * A screen to lend resource.
 ****************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './main_screen.dart';
import './main_appbar.dart';
import './main_drawer.dart';
import './lending_resource.dart';
import './lending_search_result.dart';

/****************
 * LendingScreen
 * Displays a screen to lend resource.
 ****************/
class LendingScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  List<Widget> lendingList = [];
  var lendingSearchResult = LendingSearchResult();
  var lendingResource = LendingResource();

  /****
   * refresh()
   * A callback function be called when selected resources changed.
   ****/
  void refresh() {
    setState(() {
      lendingList = lendingResource.asListOfWidget();
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
    LendingResource.setCallbackFunction(refresh);
  }

  /***
   * build()
   * Retruns widget of this class.
   ***/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(context),
      appBar: MainAppBar(context),
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
                    },
                    onSubmitted: (value) async {
                      print("submitted!");
                      var result = await callLendingAPI(value);
                      if (result) { controller.clear(); };
                    },
                    controller: controller,
                  ),
                ),
                MaterialButton(
                  child: Icon(Icons.add),
                  onPressed: () async {
                    print("add!");
                    var result = await callLendingAPI(controller.text);
                    if (result) { controller.clear(); };
                  },
                ),
              ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: lendingList,
            ),
            MaterialButton(
              child: Text(AppLocalizations.of(context)!.lend),
              onPressed: () {print("lend!");},
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

  /****
   * callLendingAPI()
   * This is a temporaly implementation to call APIs.
   ****/
  Future<bool> callLendingAPI(String value) async {
    // call api with value
    var response = ['XXX','YYY','ZZZ'];
    var result = false;
    response.forEach((r) => lendingSearchResult.add(r));
    await lendingSearchResult.show(context);
    var r = false;
    lendingSearchResult.flags.forEach((f) => r|=f!);
    if (r) {
      for (int i=0; i<lendingSearchResult.flags.length; i++) {
        if (lendingSearchResult.flags[i]==true) {
          lendingResource.add(lendingSearchResult.ids[i]);
        };
      };
      result = true;
    };
    lendingSearchResult.flush();
    return result;
  }
}
