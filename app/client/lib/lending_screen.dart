/****************************************************************
 * lending_screen.dart
 * A screen to lend resource.
 ****************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './resource.dart';
import './selectable_resource_list.dart';
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
  var lendingSearchResult = LendingSearchResult();
  var lendingResource = LendingResource();

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
                      var result = await callLendingAPI(context, value);
                      if (result) { controller.clear(); };
                    },
                    controller: controller,
                  ),
                ),
                MaterialButton(
                  child: Icon(Icons.add),
                  onPressed: () async {
                    print("add!");
                    var result = await callLendingAPI(context, controller.text);
                    if (result) { controller.clear(); };
                  },
                ),
              ]
            ),
            lendingResource,
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
  Future<bool> callLendingAPI(BuildContext context, String value) async {
    // call api with value
    var response = [Resource(1, "XXX"), Resource(2, "YYY"), Resource(3, "ZZZ")];
    var result = false;
    response.forEach(lendingSearchResult.add);
    await LendingModal.show!(context, lendingSearchResult);
    var selected = lendingSearchResult.selectedResources();
    if (!selected.isEmpty) {
      selected.forEach ((r) {
          lendingResource.add(r!);
      });
      lendingResource.refresh!();
      result = true;
    };
    lendingSearchResult.flush();
    return result;
  }
}
