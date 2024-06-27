/****************************************************************
 * selectable_resource_list.dart
 * A list of Resource with boolian flag.
 ****************************************************************/

import 'package:flutter/material.dart';
import './resource.dart';

class SelectableResource {
  Resource resource;
  bool flag;
  SelectableResource(this.resource, this.flag);
}

/****************
 * SelectableResourceList
 * A list of Resource with boolian flag.
 ****************/
class SelectableResourceList {
  List<SelectableResource> resources = [];

  int get length => resources.length;

  void add(Resource r, {bool b = false}) {
    resources.add(SelectableResource(r,b));
  }

  void deleteAt(int i) {
    if (i<0 && i>=this.length) { return; }
    resources.removeAt(i);
  }

  void flush() {
    resources = [];
  }

  SelectableResource at(int i) {
    return resources[i];
  }

  List<Resource?> selectedResources() {
    var result = resources.map((sr) => sr.flag ? sr.resource : null).toList();
    result.removeWhere((r) => r == null);
    return result;
  }
}

