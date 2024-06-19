import 'package:flutter/material.dart';
import './admin_screen.dart';
import './admin_appbar.dart';
import './admin_drawer.dart';
import './user_registration_resource.dart';

class UserRegistrationScreen extends StatelessWidget {
  const UserRegistrationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return UserRegistrationScreenApp(title: 'Flutter Demo Home Page');
  }
}

class UserRegistrationScreenApp extends StatefulWidget {
  const UserRegistrationScreenApp({super.key, required this.title});
  final String title;
  @override
  State<UserRegistrationScreenApp> createState() => _UserRegistrationScreenAppState();
}

class _UserRegistrationScreenAppState extends State<UserRegistrationScreenApp> {
  String id = "";
  final TextEditingController controller = TextEditingController();
  List<Widget> widgets = [];
  var resource = UserRegistrationResource();

  void refresh() {
    setState(() {
      widgets = resource.asListOfWidget();
    });
  }

  void flush() {
    setState(() {
      widgets = [];
      resource = UserRegistrationResource();
    });
  }

  @override
  void initState() {
    super.initState();
    UserRegistrationResource.setCallbackFunction(refresh);
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
              child: Text("登録"),
              onPressed: () {
                print("register!");
                flush();
              },
            ),
            MaterialButton(
              child: Text("戻る"),
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
