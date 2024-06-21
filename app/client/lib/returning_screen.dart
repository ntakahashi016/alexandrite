import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './main_screen.dart';
import './main_appbar.dart';
import './main_drawer.dart';
import './returning_resource.dart';

class ReturningScreen extends StatelessWidget {
  const ReturningScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ReturningScreenApp(title: 'Flutter Demo Home Page');
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
      drawer: MainDrawer(context),
      // appBar: MainAppBar(context),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: returningList,
              ),
              MaterialButton(
                child: Text(AppLocalizations.of(context)!.lend),
                onPressed: () {
                  print("return!");
                  returningResource.returnSelectedResources();
                }
              ),
              MaterialButton(
                child: Text(AppLocalizations.of(context)!.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]
          ),
        )
      ),
    );
  }
}
