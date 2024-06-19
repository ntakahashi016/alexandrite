import 'package:flutter/material.dart';
import './main_appbar.dart';
import './main_drawer.dart';

class WipScreen extends StatelessWidget {
  const WipScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WipScreenApp(title: 'Flutter Demo Home Page');
  }
}

class WipScreenApp extends StatefulWidget {
  const WipScreenApp({super.key, required this.title});
  final String title;
  @override
  State<WipScreenApp> createState() => _WipScreenAppState();
}

class _WipScreenAppState extends State<WipScreenApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(context),
      appBar: MainAppBar(context),
      body: Center(
        child: MaterialButton(
          child: Text("前の画面に戻る"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
    );
  }
}
