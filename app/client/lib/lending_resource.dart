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
  final SelectableResourceList resources;
  void Function(int)? add;
  void Function()? refresh;
  void setAddFunction(void Function(int) func) { add = func; }
  void setRefreshFunction(void Function() func) { refresh = func; }
  LendingResource({
    Key? key,
    required this.resources,
  }) : super(key: key);
  @override
  _LendingResourceState createState() => new _LendingResourceState();
}

class _LendingResourceState extends State<LendingResource> {

  void add(int i) {
    widget.resources.add(Resource(i,'xxx'));
  }

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    widget.setAddFunction(add);
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
              Text(widget.resources.at(index).id.toString()),
              Text(widget.resources.at(index).name),
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

