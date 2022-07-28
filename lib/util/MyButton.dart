import 'package:flutter/material.dart';
import 'package:to_do/screenTwo/screenTwoUI.dart';
import 'package:to_do/util/navigation.dart';

import 'blocs/app/cubit.dart';


class MyButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double height;
  final double width;
  final double onClick;
  final double radius;
  final Color buttonColor;
  final bool isCapitalize;

  const MyButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.height = 50.0,
    this.width = 300,
    required this.onClick,
    this.radius = 15.0,
    this.buttonColor = Colors.green,
    this.isCapitalize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        height: height,
        color: buttonColor,
        onPressed: () {
          if (onClick==1) {
            navigateTo(context, AddTaskScreen());
          }else{
            AppBloc.get(context).insertTasksData();
            Navigator.pop(context);

          }
        },
        child: Text(
          isCapitalize ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}