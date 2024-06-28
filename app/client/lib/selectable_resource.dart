/****************************************************************
 * selectable_resource.dart
 * A list of Resource with boolian flag.
 ****************************************************************/

import 'package:flutter/material.dart';
import './resource.dart';

class SelectableResource extends Resource {
  bool flag;
  SelectableResource(super.id, super.name, this.flag);
  SelectableResource.convert(Resource r, this.flag) : super.copy(r);
}

/****************
 * SelectableResourceList
 * A list of Resource with boolian flag.
 ****************/
class SelectableResourceList {
  List<SelectableResource> resources = [];

  int get length => resources.length;

  void add(Resource r, {bool b = false}) {
    resources.add(SelectableResource.convert(r, b));
  }

  void deleteAt(int i) {
    if (i<0 && i>=this.length) { return; }
    resources.removeAt(i);
  }

  SelectableResource at(int i) {
    return resources[i];
  }

  List<Resource?> getSelected() {
    var result = resources.map((sr) => sr.flag ? sr : null).toList();
    result.removeWhere((r) => r == null);
    return result;
  }
}

