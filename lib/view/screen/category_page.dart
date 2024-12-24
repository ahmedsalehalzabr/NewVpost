import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/controller/category_lang_controller.dart';
import 'package:posts/core/constant/routes.dart';


class CategoryPage extends StatelessWidget {
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              final newLang = controller.languageService.currentLanguage == 'ar'
                  ? 'en'
                  : 'ar';
              controller.changeLanguage(newLang);
            },
          ),
          IconButton(
              onPressed: (){Get.offNamed(AppRoute.homepage);},
              icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.categories.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    controller.categories[index]['category_qroup_title'] ??
                        'No Name Available'),
              );
            },
          );
        }
      }),
    );
  }
}