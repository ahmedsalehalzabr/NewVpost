

import 'package:get/get.dart';
import 'package:posts/core/constant/routes.dart';
import 'package:posts/core/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login) ;
  }
}