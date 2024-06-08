import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

class MenuItem {
  String name;
  IconData icon;
  MaterialColor color;

  MenuItem(this.name, this.icon, this.color);
}
