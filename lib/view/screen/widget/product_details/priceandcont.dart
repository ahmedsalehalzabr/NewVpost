import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:posts/core/constant/color.dart';
class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  final String des;
  const PriceAndCountItems(
      {Key? key,
        required this.onAdd,
        required this.onRemove,
        required this.price,
        required this.count,
      required this.des})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 2),
                width: 50,
                // height: 30,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  count,
                  style: const TextStyle(fontSize: 20, height: 1.1),
                )),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
       Row(children: [
         const SizedBox(width: 20,),
         Text(
           "Discount : $des \%",
           style: const TextStyle(
               color: AppColor.primaryColor, fontSize: 20, height: 1.1),
         ),
         const SizedBox(width: 30,),
         Text(
           "Price : $price \$",
           style: const TextStyle(
               color: AppColor.primaryColor, fontSize: 20, height: 1.1),
         ),
       ],)
        // const SizedBox(width: 20,),
        // IconButton(onPressed:() {Get.offNamed(AppRoute.cartScreen);}, icon: const Icon(Icons.shopping_cart_checkout)),
      ],
    );
  }
}