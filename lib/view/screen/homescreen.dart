import 'dart:io';
import 'package:flutter/material.dart';
import 'package:posts/controller/homescreen_controller.dart';
import 'package:posts/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:posts/view/screen/widget/home/customappbarhomescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: WillPopScope(
            child: controller.listPage.elementAt(controller.currentpage),
            onWillPop: (){
              Get.defaultDialog(
                title: "Warning",
                titleStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                middleText: "Do You Want To Exit The App",
                onCancel: (){},
                  cancelTextColor: AppColor.primaryColor,
                  confirmTextColor: AppColor.primaryColor,
                  buttonColor: AppColor.thirdColor,
                onConfirm: (){
                exit(0);
                }
              );
              return Future.value(false);
            },
          )
        ));
  }
}