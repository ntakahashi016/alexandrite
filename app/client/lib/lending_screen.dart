import 'package:flutter/material.dart';
import './main_screen.dart';
import './main_appbar.dart';
import './lending_resource.dart';

class LendingScreen extends StatelessWidget {
  const LendingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LendingScreenApp(title: 'Flutter Demo Home Page'),
    );
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
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      appBar: MainAppBar(),
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
                    lendingResource.add(id);
                    id = "";
                    controller.clear();
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
