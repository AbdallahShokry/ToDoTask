import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/TabBarViewPages/PageAll.dart';
import 'package:to_do/TabBarViewPages/PageCompleted.dart';
import 'package:to_do/TabBarViewPages/PageFavourite.dart';
import '../TabBarViewPages/PageUncompleted.dart';
import '../util/MyButton.dart';
import '../util/blocs/app/cubit.dart';
import '../util/blocs/app/states.dart';

class BorderScreen extends StatefulWidget {
  const BorderScreen({Key? key}) : super(key: key);

  @override
  _BorderScreenState createState() => _BorderScreenState();
}

class _BorderScreenState extends State<BorderScreen>
    with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            'Board',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.calendar_today_outlined),
                          tooltip: 'go to calender',
                          onPressed: () {
                            print('sdfd');
                          },
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<AppBloc, AppStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Expanded(
                            child: Column(children: [
                          Divider(height: 3, color: Colors.grey),
                          SizedBox(
                            height: 3,
                          ),
                          TabBar(
                            isScrollable: true,
                            indicatorColor: Colors.black,
                            controller: _tabController,
                            tabs: const <Widget>[
                              Tab(
                                child: Text(
                                  "All",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Completed",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Uncompleted",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Favorite",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 3, color: Colors.grey),
                              Expanded(
                                child: TabBarView(controller: _tabController,
                                    children: [ PageAll(),PageCompleted(),
                                  PageUncompleted(),PageFavourite()
                                ]),
                              )

                        ]));
                      }),
                  MyButton(text: "Add Task", onClick: 1)
                ],
              )),
        );
  }
}


