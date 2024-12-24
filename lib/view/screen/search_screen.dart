import 'package:flutter/material.dart';
import 'package:posts/controller/product_controller.dart';
import 'package:posts/linkapi.dart';
import 'package:posts/models/product_model.dart';
import 'package:posts/view/screen/product_details_screen.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({
    Key? key,
  }) : super(key: key);
  ProductControllerImp controller = Get.put(ProductControllerImp());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (controller.searchList.isEmpty && controller.searchTextController.text.isNotEmpty) {
        return Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/search.webp",
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  "No results found",
                  style: TextStyle(
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      List<PostList> allPosts = [];
      
      if (controller.searchList.isEmpty) {
        // جمع كل المنشورات من productList
        for (var product in controller.productList) {
          if (product.postList != null) {
            allPosts.addAll(product.postList!);
          }
        }
      } else {
        // جمع كل المنشورات من searchList
        for (var product in controller.searchList) {
          if (product.postList != null) {
            allPosts.addAll(product.postList!);
          }
        }
      }

      return Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: allPosts.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.7,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            maxCrossAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            final post = allPosts[index];
            
            return buildCardItems(
              image: post.imageUrl ?? '',
              name: post.postTitle ?? '',
              platformId: post.nid?.toString() ?? '',
              regionId: post.categoryTitle ?? '',
              catalogId: post.nid?.toString() ?? '',
              productModels: controller.searchList.isEmpty 
                ? controller.productList.first 
                : controller.searchList.first,
              onTap: () {
                // تمرير المنتج الأساسي مع المنشور المحدد
                final parentProduct = controller.searchList.isEmpty 
                    ? controller.productList.firstWhere(
                        (product) => product.postList?.any((p) => p.nid == post.nid) ?? false,
                        orElse: () => controller.productList.first)
                    : controller.searchList.firstWhere(
                        (product) => product.postList?.any((p) => p.nid == post.nid) ?? false,
                        orElse: () => controller.searchList.first);
                        
                Get.to(() => ProductDetailsScreen(
                  productModel: parentProduct,
                ));
              },
            );
          },
        ),
      );
    });
  }

  Widget buildCardItems({
    required String image,
    required String name,
    required String platformId,
    required String regionId,
    required String catalogId,
    required ProductModel productModels,
    required Function() onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      AppLink.signUp + image,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 140,
                          color: Colors.grey[300],
                          child: const Icon(Icons.error_outline),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      radius: 18,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => controller.manageFavourites(catalogId),
                        icon: Icon(
                          controller.isFavourites(catalogId)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: controller.isFavourites(catalogId)
                              ? Colors.red
                              : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      regionId,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
