import 'package:flutter/material.dart';

class UserRegistrationResource {
  List<String> ids = [];
  static void Function()? _callback;

  static void setCallbackFunction(void Function() func) {
     _callback = func;
  }

  void add(String id) {
    if (id=="") { return; };
    ids.add(id);
    _callback?.call();
  }

  void deleteAt(int index) {
    if (index<0 && index>=ids.length) { return; };
    ids.removeAt(index);
    _callback?.call();
  }

  List<Widget> asListOfWidget() {
    return ids.asMap().entries.map((e) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text((e.key+1).toString()),
          Text(e.value),
          MaterialButton(
            child: Text("-"),
            onPressed: () {
              print("delete!");
              this.deleteAt(e.key);
            },
          ),
        ]
      )
    ).toList();
  }
}

