/****************************************************************
 * returning_resource.dart
 * A structure of resources of selected to return.
 ****************************************************************/

import 'package:flutter/material.dart';
import './returning_screen.dart';

/****************
 * LendingResource
 * 
 ****************/
class ReturningResource {
  List<String> ids = ['a', 'b', 'c'];
  List<bool> flags = [false,false,false];
  static void Function()? _callback;

  /****
   * setCallbackFunction()
   * A setter to callback.
   ****/
  static void setCallbackFunction(void Function() func) {
     _callback = func;
  }

  /****
   * returnSelectedResources()
   * 
   ****/
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

  /****
   * asListOfWidget()
   * Returns a list of resources.
   ****/
  List<Widget> asListOfWidget() {
    return ids.asMap().entries.map((e) =>
      Card(
        child: Column(
          children: [
            ListTile(
              leading: new Checkbox(
                value: flags[e.key],
                onChanged:  (bool? f) {
                  flags[e.key] = f!;
                  _callback?.call();
                },
              ),
              title: Text((e.key+1).toString()),
              subtitle: Text(e.value),
            ),
          ]
        ),
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        elevation:8,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    ).toList();
  }
}

