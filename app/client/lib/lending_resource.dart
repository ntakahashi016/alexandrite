/****************************************************************
 * lending_resource.dart
 * 
 ****************************************************************/

import 'package:flutter/material.dart';
import './resource.dart';
import './selectable_resource_list.dart';

/****************
 * LendingResource
 * 
 ****************/
class LendingResource extends StatefulWidget {
  SelectableResourceList resources = SelectableResourceList();
  void Function()? refresh;
  void setRefreshFunction(void Function() func) { refresh = func; }
  void add(Resource r) {
    resources.add(r);
  }
  @override
  _LendingResourceState createState() => new _LendingResourceState();
}

class _LendingResourceState extends State<LendingResource> {

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    widget.setRefreshFunction(refresh);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: widget.resources.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text((index+1).toString()),
              Text(widget.resources.at(index).resource.name),
              MaterialButton(
                child: Text("-"),
                onPressed: () {
                  setState(() {
                    print("delete!");
                    widget.resources.deleteAt(index);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

