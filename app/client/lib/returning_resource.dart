import 'package:flutter/material.dart';
import './returning_screen.dart';

class ReturningResource {
  List<String> ids = ['a', 'b', 'c'];
  List<bool> flags = [false,false,false];
  static void Function()? _callback;

  static void setCallbackFunction(void Function() func) {
     _callback = func;
  }

  void returnSelectedResources() {
    var r = false;
    flags.forEach((f) => r|=f);
    if (!r) { return; }
    for (int i=ids.length-1; i>=0; i--) {
      if (flags[i]) {
        ids.removeAt(i);
        flags.removeAt(i);
      }
    }
    _callback?.call();
  }

  List<Widget> asListOfWidget() {
    return ids.asMap().entries.map((e) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text((e.key+1).toString()),
          Text(e.value),
          new Checkbox(
            value: flags[e.key],
            onChanged:  (bool? f) {
              flags[e.key] = f!;
              _callback?.call();
            },
          ),
        ]
      )
    ).toList();
  }
}

