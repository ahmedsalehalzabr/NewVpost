import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/controller/category_id_controller.dart';
import 'package:posts/controller/home_controller.dart';
import 'package:posts/models/categories_model.dart';
import 'package:posts/models/category_id_model.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final ScrollController _scrollController = ScrollController();
  final HomeControllerImp controller = Get.put(HomeControllerImp());
  final CategoryIdController controller2 = Get.put(CategoryIdController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey[800] : Colors.purple.shade50,
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'القائمة',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.purple,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.close_rounded,
                      color: Get.isDarkMode ? Colors.red : Colors.purple,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return controller.categoryList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Get.isDarkMode ? Colors.red : Colors.purple,
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, categoryIndex) {
                        final category = controller.categoryList[categoryIndex];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (categoryIndex > 0) const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                color: Get.isDarkMode ? Colors.grey[800] : Colors.purple.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                category.categoryQroupTitle.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode ? Colors.white : Colors.purple,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: category.categoryList?.length ?? 0,
                              itemBuilder: (context, index) {
                                final subItem = category.categoryList![index];
                                return buildCardItems2(
                                  name: subItem.categoryTitle.toString(),
                                  category1001Model: category,
                                  onTap: () {
                                    controller2.fetchCategoryId(subItem.id.toString());
                                    Get.back();
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildCardItems2({
    required String name,
    required Function() onTap,
    required CategoryModel category1001Model,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  color: Get.isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Get.isDarkMode ? Colors.white54 : Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTiles({
    required String label,
    required Function fct,
    required IconData icon,
  }) {
    return ListTile(
      onTap: () {
        fct();
      },
      leading: Icon(
        icon,
        color: Get.isDarkMode ? Colors.red : Colors.purple,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
