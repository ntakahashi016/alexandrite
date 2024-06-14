import 'package:flutter/material.dart';
import './main_screen.dart';
import './returning_resource.dart';

class ReturningScreen extends StatelessWidget {
  const ReturningScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReturningScreenApp(title: 'Flutter Demo Home Page'),
    );
  }
}

class ReturningScreenApp extends StatefulWidget {
  const ReturningScreenApp({super.key, required this.title});
  final String title;
  @override
  State<ReturningScreenApp> createState() => _ReturningScreenAppState();
}

class _ReturningScreenAppState extends State<ReturningScreenApp> {
  List<Widget> returningList = [];
  var returningResource = ReturningResource();

  void refresh() {
    setState(() {
      returningList = returningResource.asListOfWidget();
    });
  }

  @override
  void initState() {
    super.initState();
    ReturningResource.setCallbackFunction(refresh);
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.import_contacts),
          Text("おうち図書館システム"),
        ]),
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: returningList,
            ),
            MaterialButton(
              child: Text("返す"),
              onPressed: () {
                print("return!");
                returningResource.returnSelectedResources();
              }
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
