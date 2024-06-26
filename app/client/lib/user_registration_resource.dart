/****************************************************************
 * user_registration_resource.dart
 * A structure of user of trying to add.
 ****************************************************************/

import 'package:flutter/material.dart';

/****************
 * UserRegistrationResource
 * 
 ****************/
class UserRegistrationResource {
  List<String> ids = [];
  static void Function()? _callback;

  /****
   * setCallbackFunction()
   * A setter to callback.
   ****/
  static void setCallbackFunction(void Function() func) {
     _callback = func;
  }

  /****
   * add()
   * Adds resource information.
   ****/
  void add(String id) {
    if (id=="") { return; };
    ids.add(id);
    _callback?.call();
  }

  /****
   * deleteAt()
   * Delete a resource specified index.
   ****/
  void deleteAt(int index) {
    if (index<0 && index>=ids.length) { return; };
    ids.removeAt(index);
    _callback?.call();
  }

  /****
   * asListOfWidget()
   * Returns a list of resources.
   ****/
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

