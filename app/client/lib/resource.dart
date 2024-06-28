/****************************************************************
 * resource.dart
 * A structure of resources
 ****************************************************************/

import 'package:flutter/material.dart';

/****************
 * Resource
 *
 ****************/
class Resource {
  int id;
  String name;

  /****
   * constructor
   ****/
  Resource(this.id, this.name);
  Resource.copy(Resource r) : this(r.id, r.name);
}
