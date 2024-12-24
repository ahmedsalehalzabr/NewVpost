import 'package:flutter/material.dart';
import 'package:posts/core/constant/color.dart';

class CustomTitleItem extends StatelessWidget {
  final String title ;
  const CustomTitleItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style:const  TextStyle(
              fontSize: 20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold)),
    );
  }
}