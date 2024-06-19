import 'package:flutter/material.dart';
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
  String id = "";
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
                      id = value;
                    },
                    controller: controller,
                  ),
                ),
                MaterialButton(
                  child: Icon(Icons.add),
                  onPressed: () async {
                    print("add!");
                    var response = ['XXX','YYY','ZZZ'];
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
                      id = "";
                      controller.clear();
                    };
                    lendingSearchResult.flush();
                  },
                ),
              ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: lendingList,
            ),
            MaterialButton(
              child: Text("借りる"),
              onPressed: () {print("lend!");},
            ),
            MaterialButton(
              child: Text("戻る"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
              },
            ),
          ]
        )
      ),
    );
  }
}
