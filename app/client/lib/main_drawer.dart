import 'package:flutter/material.dart';
import './menu_item.dart';
import './admin_screen.dart';
import './wip_screen.dart';

class MainDrawer extends Drawer {
  static const _items = [
      const MenuItem("管理画面", Icons.settings_applications , Colors.blue,   AdminScreen()),
  ];

  MainDrawer(BuildContext context) : super(
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
