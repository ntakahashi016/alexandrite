/****************************************************************
 * lending_search_result.dart
 * A structure of results of calling lending API.
 ****************************************************************/

import 'package:flutter/material.dart';

/****************
 * LendingSearchResult
 * A structure of results of calling lending API.
 ****************/
class LendingSearchResult{
  List<String> ids = [];
  List<bool?> flags = [];

  /****
   * add()
   * Adds information of result.
   * Currently, it stores resource_id and selected_flag.
   ****/
  void add(String id, {bool? flag = false}) {
    ids.add(id);
    flags.add(flag);
  }

  /****
   * flush()
   * Delete all information of result.
   * It is assumed used when canceled selection.
   ****/
  void flush() {
    ids = [];
    flags = [];
  }

  /****
   * asListOfWidget()
   * Returns a list of resources.
   ****/
  List<Widget> asListOfWidget(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < ids.length; i++) {
      list.add(
        StatefulBuilder(
          builder: (context, setState2) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: new Checkbox(
                      value: flags[i],
                      onChanged: (bool? b) {
                        setState2(() {flags[i] = b!;});
                      },
                    ),
                    title: Text(i.toString()),
                    subtitle: Text(ids[i]),
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
    return list;
  }

  /****
   * show()
   * This shows API's result as a modal window.
   ****/
  Future show(BuildContext context) {
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
                child: ListView(
                  children: asListOfWidget(context),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context, flags);},
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
