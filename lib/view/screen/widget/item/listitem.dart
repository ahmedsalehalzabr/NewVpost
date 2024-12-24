// import 'dart:ffi';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:full_ecommerce/controller/product_controller.dart';
// import 'package:full_ecommerce/core/constant/color.dart';
// import 'package:full_ecommerce/core/functions/translateDatabase.dart';
// import 'package:full_ecommerce/models/categories_model.dart';
// import 'package:get/get.dart';
//
// class CustomListItems extends GetView<ProductControllerImp> {
//  // final CategoryModel categoriesModel;
//   final String title;
//   final Double price;
//   final String id;
//   final String urlHandle;
//   final String featuredImageUrl;
//   const CustomListItems(this.title, this.price, this.id, this.urlHandle, this.featuredImageUrl, {Key? key, required this.price, double? price}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: (){
//           controller.goToPageProductDetails(productModel) ;
//         },
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Hero(
//                     tag:"${productModel.id}" ,
//                     child: CachedNetworkImage(
//                       imageUrl: productModel.featuredImageUrl.toString(),
//                       height: 100,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   const SizedBox(height: 10) ,
//                   Text(translateDatabase(productModel.urlHandle, productModel.title),
//                       style:const TextStyle(
//                           color: AppColor.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text("Rating 3.5 ", textAlign: TextAlign.center),
//                       Container(
//                         alignment: Alignment.bottomCenter,
//                         height: 22,
//                         child: Row(
//                           children: [
//                             ...List.generate(
//                                 5,
//                                     (index) =>const Icon(
//                                   Icons.star,
//                                   size: 15,
//                                 ))
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("${productModel.price} \$",
//                           style:const TextStyle(
//                               color: AppColor.primaryColor,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "sans")),
//                       IconButton(
//                           onPressed: () {},
//                           icon:const Icon(
//                             Icons.favorite,
//                             color: AppColor.primaryColor,
//                           ))
//                     ],
//                   )
//                 ]),
//           ),
//         ));
//   }
// }