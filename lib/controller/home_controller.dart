
import 'package:flutter/material.dart';
import 'package:posts/core/services/category_services.dart';
import 'package:posts/core/services/services.dart';
import 'package:posts/models/categories_model.dart';
import 'package:get/get.dart';

abstract class  HomeController extends GetxController {
  initialData()  ;
  onInit();
  getCategorys();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;

  //search
  var searchList = <CategoryModel>[].obs;
  TextEditingController searchTextController = TextEditingController();

  void getCategorys() async {
    var category = await CategoryServices.getCategory();

    try {
      isLoading(true);
      if (category!.isNotEmpty) {
        categoryList.addAll(category);
      }
    } finally {
      isLoading(false);
    }
  }
  var categoryList = <CategoryModel>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //getAllProducts();
    getCategorys();
    update();
  }

  // Future<void> getAllProducts() async{
  //   var user = await CategoryServices.getCategory();
  //   if(user != null)
  //   {
  //     CategoryModel.value = user;
  //     isLoading.value = false;
  //   }
  // }






  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang") ;
    username = myServices.sharedPreferences.getString("token") ;
    id = myServices.sharedPreferences.getString("email") ;
  }




}