import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posts/controller/homescreen_controller.dart';
import 'package:posts/view/screen/widget/home/custombottomapbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              controller.listPage.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : Expanded(
                        child: CustomButtonAppBar(
                          textbutton: controller.titlebottomappbar[i],
                          icondata: controller.iconsbottomappbar[i],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentpage == i,
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}