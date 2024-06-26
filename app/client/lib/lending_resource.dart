/****************************************************************
 * lending_resource.dart
 * 
 ****************************************************************/

import 'package:flutter/material.dart';
import './selectable_resource_list.dart';

/****************
 * LendingResource
 * 
 ****************/
class LendingResource extends StatefulWidget {
}

class _LendingResourceState extends State<LendingResource> {
  var resources = SelectableResourceList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: resources.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(
            child: Row(
              children: [
                Text(resources.at(index).id.toString()),
                Text(resources.at(index).name),
                MaterialButton(
                  child: Text("-"),
                  onPressed: () {
                    print("delete!");
                    resources.deleteAt(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

