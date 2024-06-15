import 'package:flutter/material.dart';
import './main_appbar.dart';
import './main_drawer.dart';
import './menu_item.dart';
import './lending_screen.dart';
import './returning_screen.dart';
import './wip_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreenApp(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainScreenApp extends StatefulWidget {
  const MainScreenApp({super.key, required this.title});
  final String title;
  @override
  State<MainScreenApp> createState() => _MainScreenAppState();
}

class _MainScreenAppState extends State<MainScreenApp> {
  static const _items = [
      const MenuItem("貸出", Icons.download , Colors.blue,   LendingScreen()),
      const MenuItem("返却", Icons.unarchive, Colors.red,    ReturningScreen()),
      const MenuItem("検索", Icons.search   , Colors.green , WipScreen()),
      const MenuItem("履歴", Icons.history  , Colors.yellow, WipScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(context),
      appBar: MainAppBar(),
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
