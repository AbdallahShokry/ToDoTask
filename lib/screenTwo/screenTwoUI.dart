import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do/util/MyButton.dart';
import 'package:to_do/util/blocs/app/cubit.dart';


import '../util/TextFormF.dart';
import '../util/blocs/app/states.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override

  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  @override

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day ,now.hour,now.minute);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Add task',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: BlocConsumer<AppBloc, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MyTextFormF(
                        controller: AppBloc.get(context).titleController,
                        MyLableText: 'Title',
                        MyHintText: 'Task Name',
                        width: width * 0.9,
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      MyTextFormF(
                          controller: AppBloc.get(context).currentDateController,
                          width: width * 0.9,
                          MyLableText: 'Current Day',
                          MyHintText: '${date.year}-${date.month}-${date.day}'),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        MyTextFormF(
                            controller: AppBloc.get(context).startTimeController,
                            width: width * 0.42,
                            MyLableText: 'Start time',
                            MyHintText: '${date.hour}:${date.minute}',
                            MyIcon: Icons.timer),
                        SizedBox(
                          width: width * 0.06,
                        ),
                        MyTextFormF(
                            controller: AppBloc.get(context).endTimeController,
                            width: width * 0.42,
                            MyLableText: 'End time',
                            MyHintText: '14 Pm',
                            MyIcon: Icons.timer)
                      ]),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      MyTextFormF(
                          controller: AppBloc.get(context).remindController,
                          width: width * 0.9,
                          MyLableText: 'Remind',
                          MyHintText: '10 minutes early'),
                      SizedBox(
                        height: height * 0.3,
                      ),
                      MyButton(text: 'Create a Task', onClick: 2)
                    ],
                  ),
                ),
              ),
            );
          },
        ))
        ;
  }
}
