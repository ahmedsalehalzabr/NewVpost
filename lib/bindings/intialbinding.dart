import 'package:get/get.dart';
import 'package:posts/core/class/crud.dart';
import 'package:posts/core/services/category_services.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(Crud()) ;
    Get.put(LanguageService());
    Get.put(ApiService());
  }
}