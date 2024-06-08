import 'package:flutter/material.dart';
import './menu_item.dart';

class MainMenu {
  static const items = [
      const MenuItem("貸出", Icons.import_contacts, Colors.blue),
      const MenuItem("返却", Icons.import_contacts, Colors.red),
      const MenuItem("検索", Icons.import_contacts, Colors.green),
      const MenuItem("履歴", Icons.import_contacts, Colors.yellow),
    ];

  static List<MenuItem> getMainMenu() {
    return MainMenu.items;
  }
}
