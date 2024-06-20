import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), //English
        Locale('ja'), //Japanese
        Locale('ar'), //Arabic
      ],
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(context),
      appBar: MainAppBar(context),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.77,
        shrinkWrap: true,
        children: [
          ButtonTheme(
            child: MaterialButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => LendingScreen()))},
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download, size: 28.0),
                  Text(AppLocalizations.of(context)!.lend, style: TextStyle( fontSize: 28.0)),
                ],
              ),
            ),
          ),
          ButtonTheme(
            child: MaterialButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => ReturningScreen()))},
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.unarchive, size: 28.0),
                  Text(AppLocalizations.of(context)!.returning, style: TextStyle( fontSize: 28.0)),
                ],
              ),
            ),
          ),
          ButtonTheme(
            child: MaterialButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => WipScreen()))},
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 28.0),
                  Text(AppLocalizations.of(context)!.search, style: TextStyle( fontSize: 28.0)),
                ],
              ),
            ),
          ),
          ButtonTheme(
            child: MaterialButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => WipScreen()))},
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 28.0),
                  Text(AppLocalizations.of(context)!.history, style: TextStyle( fontSize: 28.0)),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
