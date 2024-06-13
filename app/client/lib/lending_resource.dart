import 'package:flutter/material.dart';
import './lending_screen.dart';

class LendingResource {
  List<String> ids = [];
  static void Function()? _callback;

  static void setCallbackFunction(void Function() func) {
     _callback = func;
  }

  void addResource(String id) {
    if (id=="") { return; };
    ids.add(id);
    _callback?.call();
  }

  void deleteResrouceAt(int index) {
    if (index<0 && index>=ids.length) { return; };
    ids.removeAt(index);
    _callback?.call();
  }

  List<Widget> getResources() {
    return ids.asMap().entries.map((e) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(e.key.toString()),
          Text(e.value),
          MaterialButton(
            child: Text("-"),
            onPressed: () {
              print("delete!");
              this.deleteResrouceAt(e.key);
            },
          ),
        ]
      )
    ).toList();
  }
}

