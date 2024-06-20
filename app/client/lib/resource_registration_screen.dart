import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './admin_screen.dart';
import './admin_appbar.dart';
import './admin_drawer.dart';
import './resource_registration_resource.dart';

class ResourceRegistrationScreen extends StatelessWidget {
  const ResourceRegistrationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ResourceRegistrationScreenApp(title: 'Flutter Demo Home Page');
  }
}

class ResourceRegistrationScreenApp extends StatefulWidget {
  const ResourceRegistrationScreenApp({super.key, required this.title});
  final String title;
  @override
  State<ResourceRegistrationScreenApp> createState() => _ResourceRegistrationScreenAppState();
}

class _ResourceRegistrationScreenAppState extends State<ResourceRegistrationScreenApp> {
  String id = "";
  final TextEditingController controller = TextEditingController();
  List<Widget> widgets = [];
  var resource = ResourceRegistrationResource();

  void refresh() {
    setState(() {
      widgets = resource.asListOfWidget();
    });
  }

  void flush() {
    setState(() {
      widgets = [];
      resource = ResourceRegistrationResource();
    });
  }

  @override
  void initState() {
    super.initState();
    ResourceRegistrationResource.setCallbackFunction(refresh);
  }

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
