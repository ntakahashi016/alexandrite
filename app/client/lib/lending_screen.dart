import 'package:flutter/material.dart';
import './main_screen.dart';

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
      body: Center(
        child: MaterialButton(
          child: Text("戻る"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
        )
      ),
    );
  }
}
