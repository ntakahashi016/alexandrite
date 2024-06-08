import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final MaterialColor color;
  final Widget route;

  const MenuItem(this.name, this.icon, this.color, this.route);
}
