import 'package:flutter/material.dart';
import 'package:posts/core/constant/color.dart';
import 'package:posts/view/screen/search_screen.dart';
import 'package:posts/view/screen/widget/home/SearchFormText.dart';


class CustomAppBar extends StatelessWidget {
  final String titleappbar ;
  final void Function()? onPressedIcon ;
  final void Function()? onPressedSearch ;
  const CustomAppBar({Key? key, required this.titleappbar, this.onPressedIcon, this.onPressedSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Row(children: [
          // Expanded(
          //   child: Card(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     elevation: 5, // درجة الظل للبطاقة
          //     child: Padding(
          //       padding: EdgeInsets.all(11.0),
          //       child: Text(titleappbar,
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 18,
          //
          //       ),),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
              width: 60,
              padding: EdgeInsets.symmetric(vertical: 12).copyWith(left: 16),
              child: Text(titleappbar,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,

                ),),
            ),
          ),

          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: AppColor.primaryColor,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Container(
                        height: 500,
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
      
                              SearchFormText(),
                              SizedBox(height: 5),
                              SearchScreen(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}