import 'package:flutter/material.dart';
import './main_menu.dart';

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
  var mainMenu = MainMenu.getMainMenu();
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
              color: mainMenu[index].color
            ),
            child: GridTile(
              child: Icon(mainMenu[index].icon),
              footer: Center(
                child: Text(
                  mainMenu[index].name
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