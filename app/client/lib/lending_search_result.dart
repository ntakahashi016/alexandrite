/****************************************************************
 * lending_search_result.dart
 * A structure of results of calling lending API.
 ****************************************************************/

import 'package:flutter/material.dart';
import './resource.dart';
import './selectable_resource.dart';

/****************
 * LendingSearchResult
 * A structure of results of calling lending API.
 ****************/
class LendingSearchResult extends StatelessWidget {
  SelectableResourceList resources = SelectableResourceList();

  /****
   * add()
   * 
   ****/
  void add(Resource r) { resources.add(r); }

  /****
   * selectedResources()
   * 
   ****/
  List<Resource?> getSelected() { return resources.getSelected(); }

  /****
   * build()
   * 
   ****/
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: resources.length,
      itemBuilder: (BuildContext context, int index) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: new Checkbox(
                      value: resources.at(index).flag,
                      onChanged: (bool? b) {
                        setState(() {resources.at(index).flag = b!;});
                      },
                    ),
                    title: Text(index.toString()),
                    subtitle: Text(resources.at(index).name),
                  ),
                ],
              ),
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              elevation:8,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        );
      },
    );
  }
}

class LendingModal {
  static Future show(BuildContext context, LendingSearchResult lsr) {
    final Widget dialog = Dialog(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('検索結果'),
              SizedBox(
                height: 500,
                child: lsr,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context);},
                    child: Text('Yes'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('No'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.green[100]
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
