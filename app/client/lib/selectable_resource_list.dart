/****************************************************************
 * selectable_resource_list.dart
 * A list of Resource with boolian flag.
 ****************************************************************/

import 'package:flutter/material.dart';
import './resource.dart';

/****************
 * SelectableResourceList
 * A list of Resource with boolian flag.
 ****************/
class SelectableResourceList {
  List<Resource> resources = [];
  List<bool> flags = [];
  int length = 0;

  void add(Resource r, {bool b = false}) {
    resources.add(r);
    flags.add(b);
    length++;
  }

  void deleteAt(int i) {
    if (i<0 && i>=resources.length) { return; }
    resources.removeAt(i);
    flags.removeAt(i);
    length--;
  }

  void flush() {
    resources = [];
    flags = [];
  }

  Resource at(int i) {
    return resources[i];
  }
}

