import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:posts/core/services/product_services.dart';
import 'package:posts/core/services/services.dart';
import 'package:posts/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductController extends GetxController {
  initialData();
  getdata();
  onInit();
  getProducts();
  goToPageProductDetails(ProductModel productModel);
}

class ProductControllerImp extends ProductController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var favouritesList = <ProductModel>[].obs;
  var sharedPreferences = SharedPreferences.getInstance();
  var searchList = <ProductModel>[].obs;
  ProductServices productService = ProductServices();

  void manageFavourites(String catalogId) async {
    var existingIndex =
    favouritesList.indexWhere((element) => element.id == catalogId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      var prefs = await sharedPreferences;
      await prefs.remove("isFavouritesList");
    } else {
      favouritesList.add(
          productList.firstWhere((element) => element.id == catalogId));
      var prefs = await sharedPreferences;
      var favouritesListJson =
      favouritesList.map((product) => product.toJson()).toList();
      await prefs.setStringList("isFavouritesList", favouritesListJson.map((e) => json.encode(e)).toList());
    }
  }

  bool isFavourites(String catalogId) {
    return favouritesList.any((element) => element.id == catalogId);
  }

  TextEditingController searchTextController = TextEditingController();
  int get count => favouritesList.length;
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.categoryTitle!.toLowerCase();

      return searchTitle.contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }

  Future<void> clearCache() async {
    var prefs = await sharedPreferences;
    await prefs.remove('cached_products');
    productList.clear();
    await getProducts(); // Fetch fresh data
  }




  getProducts() async {
    try {
      isLoading(true);

      // تحميل البيانات من الكاش
      var prefs = await sharedPreferences;
      var cachedData = prefs.getStringList('cached_products');

      if (cachedData != null && cachedData.isNotEmpty) {
        productList.value = cachedData
            .map((e) => ProductModel.fromJson(json.decode(e)))
            .toList();
      }

      // التحقق من الاتصال بالشبكة
      if (await _isConnectedToInternet()) {
        // تحميل البيانات من الشبكة
        var product = await ProductServices.getProduct();
        if (product != null && product.isNotEmpty) {
          productList.value = product;

          // تخزين البيانات الجديدة في الكاش
          var productsJson = product.map((item) => json.encode(item.toJson())).toList();
          await prefs.setStringList('cached_products', productsJson);
        }
      } else {
        print("No internet connection");
      }
    } on SocketException catch (e) {
      print("Network error: $e");
    } catch (e) {
      print("Unexpected error: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<bool> _isConnectedToInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  // getProducts() async {
  //   try {
  //     isLoading(true);
  //
  //     // First try to load from cache
  //     var prefs = await sharedPreferences;
  //     var cachedData = prefs.getStringList('cached_products');
  //
  //     if (cachedData != null && cachedData.isNotEmpty) {
  //       productList.value = cachedData
  //           .map((e) => ProductModel.fromJson(json.decode(e)))
  //           .toList();
  //     }
  //
  //     // Then fetch fresh data from network
  //     var product = await ProductServices.getProduct();
  //     if (product != null && product.isNotEmpty) {
  //       productList.value = product;
  //
  //       // Cache the new data
  //       var productsJson = product
  //           .map((item) => json.encode(item.toJson()))
  //           .toList();
  //       await prefs.setStringList('cached_products', productsJson);
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() async {
    super.onInit();

    SharedPreferences prefs = await sharedPreferences;
    List<String>? storedShoppings = prefs.getStringList('isFavouritesList');

    if (storedShoppings != null) {
      favouritesList = storedShoppings
          .map((e) => ProductModel.fromJson(json.decode(e)))
          .toList()
          .obs;
    }
    getProducts();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("token");
    id = myServices.sharedPreferences.getString("email");
  }

  @override
  getdata() async {
    update();
  }

  @override
  goToPageProductDetails(productModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": productModel});
  }
}