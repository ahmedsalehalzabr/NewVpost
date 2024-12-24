import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:posts/controller/home_controller.dart';
import 'package:posts/controller/product_controller.dart';
import 'package:posts/core/constant/routes.dart';
import 'package:posts/linkapi.dart';
import 'package:posts/view/screen/widget/drawer.dart';
import 'package:posts/view/screen/widget/home/customerproduct.dart';
import 'package:posts/view/screen/widget/home/customtitlehome.dart';
import 'package:get/get.dart';
import 'search_screen.dart';
import 'widget/home/SearchFormText.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    ProductControllerImp controllers = Get.put(ProductControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black.withOpacity(0.8) : Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
          titleSpacing: 0,
          leading: Builder(
            builder: (ctx) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Get.isDarkMode ? Colors.white : Colors.black87,
              ),
              onPressed: () => Scaffold.of(ctx).openDrawer(),
            ),
          ),
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.offNamed(AppRoute.categorypage);
                },
                icon: Image.asset(
                  'assets/images/logo.png',
                  width: 40,
                  height: 40,

                ),
              ),
              SizedBox(width:10),
              IconButton(onPressed: ()
              {  Get.offNamed(AppRoute.vvv);},
                  icon: Icon(Icons.language)),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Get.isDarkMode ? Colors.white : Colors.black87,
              ),
              onPressed: () => _showSearchBottomSheet(context),
            ),
            SizedBox(width: 8),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            return await controllers.getProducts();
          },
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16),
            children: [
              _buildListViewSection(controllers),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTitleHome(title: "40".tr),
              ),
              ListProductHome(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListViewSection(ProductControllerImp controllers) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: controllers.productList.isEmpty 
          ? 0 
          : controllers.productList[0].postList?.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: _buildCarouselItem(controllers, index),
          );
        },
      ),
    );
  }

  Widget _buildCarouselItem(ProductControllerImp controllers, int index) {
    if (controllers.productList.isEmpty ||
        controllers.productList[0].postList == null ||
        controllers.productList[0].postList!.isEmpty ||
        index >= controllers.productList[0].postList!.length) {
      return _buildErrorContainer();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: AppLink.signUp +
              controllers.productList[0].postList![index].imageUrl.toString(),
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey[300],
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => _buildErrorContainer(),
        ),
      ),
    );
  }

  Widget _buildErrorContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Icon(
          Icons.error_outline,
          size: 40,
          color: Colors.grey,
        ),
      ),
    );
  }

  Future<void> _showSearchBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SearchFormText(),
            ),
            Expanded(child: SearchScreen()),
          ],
        ),
      ),
    );
  }
}
