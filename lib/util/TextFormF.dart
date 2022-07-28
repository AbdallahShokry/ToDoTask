import 'package:flutter/material.dart';

class MyTextFormF extends StatelessWidget {

  final double width;
  final double height;
  final  double radius;
  final String MyLableText;
  final String MyHintText;
  final IconData? MyIcon;
  final TextEditingController controller;
  const MyTextFormF({Key? key,
    required this.width,
    this.height = 50,
    this.radius=10,
    required this.MyLableText,
    required this.MyHintText,
    required this.controller,
    this.MyIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: TextFormField(
          controller: controller,
          textAlignVertical: TextAlignVertical.top,
          style: const TextStyle(color: Colors.black, fontSize: 18),
          decoration:  InputDecoration(
              labelText: MyLableText,
              labelStyle: TextStyle(fontSize: 18,  color: Colors.black,),
              hintText: MyHintText,
              hintStyle: TextStyle(color: Colors.grey.shade600),
              contentPadding: EdgeInsets.only(top: 6,left: 6),
            border: InputBorder.none,
            suffixIcon: Icon(MyIcon),


          )
      ),
    );
  }
}
