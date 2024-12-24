

import 'package:awesome_rating/awesome_rating.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posts/controller/product_controller.dart';



class DetailsTitle extends StatefulWidget {
  final String name;
  final String shortDescription;
 // final String price;
  final String Id;

  const DetailsTitle({
    required this.name,
    required this.shortDescription,
 //   required this.price,
    required this.Id,


    Key? key,
  }) : super(key: key);

  @override
  State<DetailsTitle> createState() => _DetailsTitleState();
}
ProductControllerImp controller =    Get.put(ProductControllerImp());
class _DetailsTitleState extends State<DetailsTitle> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,

                //  overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Obx(
                    () =>
                  //       Container(
                  // padding: const EdgeInsets.all(8),
                  // decoration: BoxDecoration(
                  //   color: Get.isDarkMode
                  //       ? Colors.white.withOpacity(0.9)
                  //       : Colors.grey.withOpacity(0.4),
                  //   shape: BoxShape.circle,
                  // ),
                  // child:
                  InkWell(
                    onTap: () {
                      controller.manageFavourites(widget.Id );
                    },
                    child: controller.isFavourites(widget.Id )
                        ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20,
                    )
                        : const Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
           //   ),
            ],
          ),
          Column(
            children: [
              Text(
                widget.shortDescription,

                //  overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          const Divider(),
          SizedBox(
            height: 5,
          ),
    //       Column(children: [
    //         Row(children: [
    //           Text('Price', style: TextStyle(
    //             fontSize: 17,
    //             fontWeight: FontWeight.bold,
    //             color: Get.isDarkMode ? Colors.white : Colors.black,),),
    //           SizedBox(width: 20),
    //           Text('${widget.price} \$', style: const TextStyle(
    //               color: AppColor.primaryColor, fontSize: 17, height: 1.1),
    // ),
    //         ],),
    //
    //
    //       ],),




        ],
      ),
    );
  }}