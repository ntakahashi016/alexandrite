import 'package:flutter/material.dart';

class MainAppBar extends AppBar{
  MainAppBar() : super(
    title: Row(
      children: const [
        Icon(Icons.import_contacts),
        Text("Alexandrite"),
      ]
    )
  ) {}
}
