import 'package:flutter/material.dart';
import './admin_appbar.dart';
import './admin_drawer.dart';
import './menu_item.dart';
import './wip_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AdminScreenApp(title: 'Flutter Demo Home Page'),
    );
  }
}

class AdminScreenApp extends StatefulWidget {
  const AdminScreenApp({super.key, required this.title});
  final String title;
  @override
  State<AdminScreenApp> createState() => _AdminScreenAppState();
}

class _AdminScreenAppState extends State<AdminScreenApp> {
  static const _items = [
      const MenuItem("ユーザー登録", Icons.person_add , Colors.blue,   WipScreen()),
      const MenuItem("リソース登録", Icons.add_box,     Colors.red,    WipScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(context),
      appBar: AdminAppBar(context),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.77,
        shrinkWrap: true,
        children: List.generate(_items.length, (index) {
          return ButtonTheme(
            child: MaterialButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => _items[index].route))},
              color: _items[index].color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_items[index].icon, size: 28.0),
                  Text(_items[index].name, style: TextStyle( fontSize: 28.0)),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
