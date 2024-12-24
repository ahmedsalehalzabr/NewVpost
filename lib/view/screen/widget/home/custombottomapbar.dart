import 'package:flutter/material.dart';
import 'package:posts/core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active   ;
  const CustomButtonAppBar(
      {Key? key,
        required this.textbutton,
        required this.icondata,
        required this.onPressed,
        required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true ? AppColor.primaryColor : AppColor.grey2,
            size: 24,
          ),
          const SizedBox(height: 2),
          Text(
            textbutton,
            style: TextStyle(
              color: active == true ? AppColor.primaryColor : AppColor.grey2,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}