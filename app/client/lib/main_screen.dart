import 'package:flutter/material.dart';
import './menu_item.dart';

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

  List<MenuItem> MainMenu = [
    MenuItem("貸出", Icons.import_contacts, Colors.blue),
    MenuItem("返却", Icons.import_contacts, Colors.red),
    MenuItem("検索", Icons.import_contacts, Colors.green),
    MenuItem("履歴", Icons.import_contacts, Colors.yellow),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.import_contacts),
          Text("おうち図書館システム"),
        ]),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.5,
        shrinkWrap: true,
        children: List.generate(4, (index) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainMenu[index].color
            ),
            child: GridTile(
              child: Icon(MainMenu[index].icon),
              footer: Center(
                child: Text(
                  MainMenu[index].name
                ),
              )
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print("押したね？")}, child: const Icon(Icons.timer)),
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
    );
  }
}
