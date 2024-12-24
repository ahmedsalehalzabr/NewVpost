import 'package:get/get.dart';
import 'package:posts/core/services/category_services.dart';

class CategoryController extends GetxController {
  final ApiService apiService = Get.find();
  final LanguageService languageService = Get.find();

  var categories = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();

    // الاستماع لتغيرات اللغة لإعادة تحميل البيانات
    ever(languageService.language, (_) => fetchCategories());
  }



  // Future<void> fetchCategories() async {
  //   print("Fetching categories in language: ${languageService.currentLanguage}");
  //   final data = await apiService.fetchCategoryGroups();
  //   print("Data fetched: $data"); // طباعة البيانات المسترجعة للتأكد من اللغة
  //   categories.value = data;
  //   categories.refresh();
  // }
  Future<void> fetchCategories() async {
    print("Fetching categories in language: ${languageService.currentLanguage}");
    categories.clear(); // مسح البيانات القديمة لضمان التحديث
    final data = await apiService.fetchCategoryGroups();
    categories.value = data;
    print("Data fetched: $data");


  }



  void changeLanguage(String langCode) {
    languageService.changeLanguage(langCode);
    fetchCategories(); // تحديث البيانات فورًا بعد تغيير اللغة
  }
}