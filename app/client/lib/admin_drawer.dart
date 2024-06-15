import 'package:flutter/material.dart';
import './menu_item.dart';
import './main_screen.dart';
import './wip_screen.dart';

class AdminDrawer extends Drawer {
  static const _items = [
      const MenuItem("利用者画面", Icons.import_contacts, Colors.blue,   MainScreen()),
  ];

  AdminDrawer(BuildContext context) : super(
    child: Column(
      children: List.generate(_items.length, (index) {
        return MaterialButton(
          child: Row(
            children: [
              Icon(_items[index].icon, size: 28.0),
              Text(_items[index].name, style: TextStyle( fontSize: 28.0 )),
            ]
          ),
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => _items[index].route))},
        );
      }),
    )
  ){}
}
