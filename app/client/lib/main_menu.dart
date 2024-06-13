import 'package:flutter/material.dart';
import './menu_item.dart';
import './lending_screen.dart';
import './wip_screen.dart';

class MainMenu {
  static const items = [
      const MenuItem("貸出", Icons.download , Colors.blue,   LendingScreen()),
      const MenuItem("返却", Icons.unarchive, Colors.red,    WipScreen()),
      const MenuItem("検索", Icons.search   , Colors.green , WipScreen()),
      const MenuItem("履歴", Icons.history  , Colors.yellow, WipScreen()),
    ];
  static List<MenuItem> getMainMenu() {
    return MainMenu.items;
  }
}
