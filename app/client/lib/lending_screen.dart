import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './main_screen.dart';
import './main_appbar.dart';
import './main_drawer.dart';
import './lending_resource.dart';
import './lending_search_result.dart';

class LendingScreen extends StatelessWidget {
  const LendingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return LendingScreenApp(title: 'Flutter Demo Home Page');
  }
}

class LendingScreenApp extends StatefulWidget {
  const LendingScreenApp({super.key, required this.title});
  final String title;
  @override
  State<LendingScreenApp> createState() => _LendingScreenAppState();
}

class _LendingScreenAppState extends State<LendingScreenApp> {
  final TextEditingController controller = TextEditingController();
  List<Widget> lendingList = [];
  var lendingSearchResult = LendingSearchResult();
  var lendingResource = LendingResource();

  void refresh() {
    setState(() {
      lendingList = lendingResource.asListOfWidget();
    });
  }

  @override
  void initState() {
    super.initState();
    LendingResource.setCallbackFunction(refresh);
  }

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
