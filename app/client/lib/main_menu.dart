import 'package:flutter/material.dart';
import './menu_item.dart';

class MainMenu {
  static const items = [
      const MenuItem("貸出", Icons.download , Colors.blue),
      const MenuItem("返却", Icons.unarchive, Colors.red),
      const MenuItem("検索", Icons.search   , Colors.green),
      const MenuItem("履歴", Icons.history  , Colors.yellow),
    ];

  static List<MenuItem> getMainMenu() {
    return MainMenu.items;
  }
}
