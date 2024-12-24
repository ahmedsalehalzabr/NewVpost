// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:posts/controller/home_controller.dart';
//
// import 'package:posts/controller/product_controller.dart';
// import 'package:posts/core/constant/color.dart';
// import 'package:posts/core/constant/routes.dart';
// import 'package:posts/core/functions/translateDatabase.dart';
// import 'package:posts/models/categories_model.dart';
// import 'package:posts/view/screen/productdetails.dart';
// import 'package:posts/view/screen/search_screen.dart';
//
//
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:posts/view/screen/widget/item/customtitle.dart';
// import 'package:readmore/readmore.dart';
//
// class CategoryDetailsScreen extends StatelessWidget {
//   late final CategoryModel categoriesModel;
//
//   CategoryDetailsScreen({Key? key, required this.categoriesModel})
//       : super(key: key);
//
//   HomeControllerImp controller2 = Get.put(HomeControllerImp());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Category Details'),
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back),
//         //   onPressed: () {
//         //     Get.offNamed(AppRoute.cartScreen);
//         //   },
//         // ),
//       ),
//       body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: ListView(
//             children: [
//               // CustomAppBar(
//               //   titleappbar: "Find Product",
//               //   onPressedIcon: () {},
//               //   onPressedSearch: () {},
//               // ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 140,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 1,
//                   itemBuilder: (context, index) {
//                     return Column(children: [
//                       Container(
//                         width: 350,
//                         decoration: BoxDecoration(
//                           color: Colors.white, // لون الخلفية الأبيض
//                           borderRadius:
//                               BorderRadius.circular(10), // شكل مدور للحواف
//                         ),
//                         child: ClipRRect(
//                           // لضمان عرض الحواف المدورة
//                           borderRadius: BorderRadius.circular(10),
//                           child: CachedNetworkImage(
//                             imageUrl:
//                                 categoriesModel.featuredImageUrl.toString(),
//                             fit: BoxFit.fill,
//                             height: 140,
//                           ),
//                         ),
//                       ),
//                     ]);
//                   },
//                 ),
//               ),
//
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Description: ${translateDatabase(categoriesModel.urlHandle.toString(), categoriesModel.name.toString())}',
//                       style: const TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     ReadMoreText(
//                       "${categoriesModel.shortDescription}",
//                       trimLines: 1,
//                       textAlign: TextAlign.justify,
//                       trimMode: TrimMode.Line,
//                       trimCollapsedText: " Show More ",
//                       trimExpandedText: " Show Less ",
//                       lessStyle: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.purple,
//                       ),
//                       moreStyle: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.purple,
//                       ),
//                       style: const TextStyle(
//                         fontSize: 16,
//                         height: 2,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const CustomTitleItem(
//                 title: "Product",
//               ),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: categoriesModel.items!.length ?? 0,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.7,
//           ),
//           itemBuilder: (BuildContext context, index) {
//              var category = categoriesModel.items![index];
//             return CustomListItems(
//               id: category.id.toString(),
//               price: category.price!,
//               title: category.title.toString(),
//               urlHandle: category.urlHandle.toString(),
//               featuredImageUrl: category.featuredImageUrl.toString(),
//
//               onTap: () {
//                 Get.to(() => ProductDetailsScreen2(
//                   id: category.id.toString(),
//                   price: category.price!,
//                   title: category.title.toString(),
//                   urlHandle: category.urlHandle.toString(),
//                   featuredImageUrl: category.featuredImageUrl.toString(),
//                   shortDescription: category.shortDescription.toString(),
//                   des: category.discount.toString(),
//                   quantity : category.quantity.toString(),
//
//                   // categoryModel: category,
//                   // productByIdModel:controller.productByIdModel,// Pass the correct object here
//                 ));
//               },
//             );
//           },
//         )
//
//               // GridView.builder(
//               //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               //       childAspectRatio: 0.4,
//               //       mainAxisSpacing: 3.0,
//               //       crossAxisSpacing: 2.0,
//               //       maxCrossAxisExtent: 200,
//               //       mainAxisExtent: 150,
//               //     ),
//               //     itemCount: widget.categoriesModel.items!.length ?? 0,
//               //     controller: _scrollController,
//               //     shrinkWrap: true,
//               //     itemBuilder: (context, index) {
//               //       return Container(
//               //           decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(8),
//               //             color: Colors.white,
//               //             boxShadow: [
//               //               BoxShadow(
//               //                 color: Colors.grey.withOpacity(0.2),
//               //                 spreadRadius: 1.0,
//               //                 blurRadius: 2.0,
//               //               ),
//               //             ],
//               //           ),
//         //           child: Stack(
//               //             children: [
//               //               ClipRRect(
//               //                 borderRadius: BorderRadius.circular(10),
//               //                 // لاحتواء الصورة ضمن الحواف المدورة
//               //                 child: Image.network(
//               //                   widget.categoriesModel.items![index].featuredImageUrl
//               //                       .toString(),
//               //                   height: 150,
//               //                   width: 180,
//               //                   fit: BoxFit
//               //                       .fill, // ضبط حجم الصورة لتناسب الحاوية
//               //                 ),
//               //               ),
//               //               Positioned(
//               //                   left: 5,
//               //                   child: Text(
//               //                     widget.categoriesModel.items![index].title
//               //                         .toString(),
//               //                     style: TextStyle(
//               //                         color: Colors.white,
//               //                         fontWeight: FontWeight.bold,
//               //                         fontSize: 14),
//               //                   ))
//               //             ],
//               //           ));
//               //     }),
//             ],
//           )),
//     );
//   }
// }
//
//
// Widget CustomListItems({
//   // required ProductModel productModel,
//   required Function() onTap,
//   required String title,
//   required double price,
//   required String id,
//   required String urlHandle,
//   required String featuredImageUrl,
//   // required CategoryModel categoriesModel,
// }) {
//   ProductControllerImp controller = Get.put(ProductControllerImp());
//
//   return InkWell(
//       // productModel:controller.productList[index],
//       onTap: onTap,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   // لاحتواء الصورة ضمن الحواف المدورة
//                   child: CachedNetworkImage(
//                     imageUrl: featuredImageUrl,
//                     height: 100,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text("${translateDatabase(urlHandle, title)}",
//                     style: TextStyle(
//                         color: AppColor.black,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Rating 5 ", textAlign: TextAlign.center),
//                     Container(
//                       alignment: Alignment.bottomCenter,
//                       height: 22,
//                       child: Row(
//                         children: [
//                           ...List.generate(
//                               5,
//                               (index) => Icon(
//                                     Icons.star,
//                                     size: 15,
//                                     color: Colors.amberAccent,
//                                   ))
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("${price} \$",
//                         style: TextStyle(
//                             color: AppColor.primaryColor,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "sans")),
//                     Obx(
//                           () => IconButton(
//                         onPressed: () {
//                           controller.manageFavourites(id);
//                         },
//                         icon: controller.isFavourites(id)
//                             ? const Icon(
//                           Icons.favorite,
//                           color: Colors.red,
//                         )
//                             : Icon(
//                           Icons.favorite_outline,
//                           color: AppColor.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ]),
//         ),
//       ));
// }
