
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/controller/product_controller.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);

  final controller = Get.find<ProductControllerImp>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerImp>(
      builder: (_) => TextField(

        controller: controller.searchTextController,
        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (searchName) {
          controller.addSearchToList(searchName);
        },
        decoration: InputDecoration(
          fillColor: Get.isDarkMode ? Colors.black12 : Colors.white,
          focusColor: Colors.red,
          prefixIcon:  Icon(
            Icons.search,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
            onPressed: () {
              controller.clearSearch();
            },
            icon:  Icon(
              Icons.close,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          )
              : null,
          hintText: "Search for Products ".tr,
          hintStyle:  TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}