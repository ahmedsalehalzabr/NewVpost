

import 'package:get/get.dart';
import 'package:posts/core/services/category_id_service.dart';
import 'package:posts/core/services/services.dart';
import 'package:posts/models/category_id_model.dart';

class CategoryIdController extends GetxController {
  var id;
  var categoryIdList = <CategoryIdModel>[].obs;
  var isLoading = true.obs;
  MyServices myServices = Get.find();


  Future<void> fetchCategoryId(String? id) async {
    if (id == null || id.isEmpty) {
      print("The provided ID is null or empty.");
      return; // الخروج إذا كانت القيمة فارغة
    }

    print("Fetching category ID: $id");
    isLoading(true); // بدء التحميل
    try {
      var response = await CategoryIdServices.getCategoryIdById(id);
      print("Response from API: $response");
      if (response != null) {
        categoryIdList.value = response; // تحديث القائمة
        print("Category ID list updated: $categoryIdList");
      } else {
        categoryIdList.clear(); // إفراغ القائمة في حال عدم وجود بيانات
      }
    } catch (e) {
      print("Error fetching category ID data: $e");
    } finally {
      isLoading(false); // إنهاء التحميل
    }
  }

  @override
  void onInit() {
    if (id != null && id.isNotEmpty) {
      fetchCategoryId(id);
    } else {
      print("ID is null or empty in onInit.");
    }

    super.onInit();
  }



}