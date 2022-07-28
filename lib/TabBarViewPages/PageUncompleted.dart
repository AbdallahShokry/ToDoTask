import 'package:flutter/material.dart';
import '../util/blocs/app/cubit.dart';
class PageUncompleted extends StatefulWidget {
  const PageUncompleted({Key? key}) : super(key: key);


  @override
  _PageUncompletedState createState() => _PageUncompletedState();
}

class _PageUncompletedState extends State<PageUncompleted> {
  var myMenuItems = <String>[
    'Completed',
    'Uncompleted',
    'Favourite',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemBuilder: (context, item) {
            return Padding(
              padding: EdgeInsets.only(left: 30, bottom: 10),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text('${AppBloc.get(context).status[item]['title']}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  PopupMenuButton<String>(
                      onSelected: onSelect,
                      itemBuilder: (BuildContext context) {
                        return myMenuItems
                            .map((String choice) {
                          return PopupMenuItem<String>(
                            child: Text(choice),
                            value: choice,
                          );
                        }).toList();
                      })
                ],
              ),
            );
          },
          itemCount: AppBloc.get(context).status.length,
        );
  }
  void onSelect(item) {
    switch (item) {
      case 'Completed':
        AppBloc.get(context).updateUserData(0);
        break;
      case 'Uncompleted':
        AppBloc.get(context).updateUserData(1);
        break;
      case 'Favourite':
        AppBloc.get(context).updateUserData(2);
        break;
    }
  }
}
