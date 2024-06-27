/****************************************************************
 * lending_search_result.dart
 * A structure of results of calling lending API.
 ****************************************************************/

import 'package:flutter/material.dart';
import './resource.dart';
import './selectable_resource_list.dart';

/****************
 * LendingSearchResult
 * A structure of results of calling lending API.
 ****************/
class LendingSearchResult extends StatefulWidget {
  SelectableResourceList resources = SelectableResourceList();
  void add(Resource r) {
    resources.add(r);
  }
  void flush() {
    resources.flush();
  }
  List<Resource?> selectedResources() {
    return resources.selectedResources();
  }
  @override
  _LendingSearchResultState createState() => new _LendingSearchResultState();
}

class _LendingSearchResultState extends State<LendingSearchResult> {

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < widget.resources.length; i++) {
      list.add(
        StatefulBuilder(
          builder: (context, setState) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: new Checkbox(
                      value: widget.resources.at(i).flag,
                      onChanged: (bool? b) {
                        setState(() {widget.resources.at(i).flag = b!;});
                      },
                    ),
                    title: Text(i.toString()),
                    subtitle: Text(widget.resources.at(i).resource.name),
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
        )
      );
    };
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return list[index];
      },
    );
  }

  // List<Widget> asListOfWidget(BuildContext context) {
  //   List<Widget> list = [];
  //   for (int i = 0; i < ids.length; i++) {
  //     list.add(
  //       StatefulBuilder(
  //         builder: (context, setState2) {
  //           return Card(
  //             child: Column(
  //               children: [
  //                 ListTile(
  //                   leading: new Checkbox(
  //                     value: flags[i],
  //                     onChanged: (bool? b) {
  //                       setState2(() {flags[i] = b!;});
  //                     },
  //                   ),
  //                   title: Text(i.toString()),
  //                   subtitle: Text(ids[i].toString()),
  //                 ),
  //               ],
  //             ),
  //             color: Colors.white,
  //             margin: const EdgeInsets.all(10),
  //             elevation:8,
  //             shadowColor: Colors.black,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //           );
  //         },
  //       )
  //     );
  //   };
  //   return list;
  // }
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
