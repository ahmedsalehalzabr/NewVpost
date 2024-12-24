//
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:posts/controller/home_controller.dart';
// import 'package:posts/core/constant/color.dart';
// import 'package:posts/core/functions/translateDatabase.dart';
// import 'package:posts/models/categories_model.dart';
// import 'package:posts/view/screen/category_details_screen.dart';
//
// class ListCategoriesHome extends StatelessWidget {
//    ListCategoriesHome({Key? key}) : super(key: key);
//   HomeControllerImp controller =    Get.put(HomeControllerImp());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//             () {
//           return  SizedBox(
//       height: 120,
//       child: ListView.separated(
//         separatorBuilder: (context, index) =>
//         const SizedBox(width: 10),
//         itemCount: controller.categoryList.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Categories(
//             categoriesModel:controller.categoryList[index],
//               onTap: () {
//                 Get.to(() => CategoryDetailsScreen(
//                   categoriesModel: controller.categoryList[index],
//
//                 ));
//               }
//           );
//         },
//
//       ),
//     );});
//   }
// }
//
//
//
//     Widget Categories({
//       required CategoryModel categoriesModel,
//       required Function() onTap,
//     }){
//
//     return InkWell(
//       onTap: onTap,
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10), // لاحتواء الصورة ضمن الحواف المدورة
//             child: Image.network(
//               categoriesModel.featuredImageUrl.toString(),
//               height: 90,
//               width: 113,
//               fit: BoxFit.fill,// ضبط حجم الصورة لتناسب الحاوية
//             ),
//           ),
//           Text(
//             "${translateDatabase(categoriesModel.urlHandle.toString(),categoriesModel.name.toString())}",
//             style: const TextStyle(
//                 fontSize: 13, color: AppColor.black),
//           )
//         ],
//       ),
//     );
//   }
