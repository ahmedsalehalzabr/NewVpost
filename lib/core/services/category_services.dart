import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts/linkapi.dart';
import 'package:posts/models/categories_model.dart';
import 'package:get/get.dart';

class CategoryServices{

  static var client = http.Client();
  static Future<List<CategoryModel>?> getCategory() async{

    var response = await client.get(Uri.parse(AppLink.server));
    if(response.statusCode == 200)
    {
      var convertedJosnData = jsonDecode(response.body);
      return (convertedJosnData as List).map((e) => CategoryModel.fromJson(e)).toList();
    }
    else
    {
      return null;
    }
  }
}




class LanguageService extends GetxService {
  final RxString language = 'en'.obs;

  void changeLanguage(String langCode) {
    language.value = langCode;
    print("Language changed to: $langCode"); // تأكيد تغيير اللغة
  }



  String get currentLanguage => language.value;
}



class ApiService extends GetxService {
  final LanguageService languageService = Get.find();

  Future<dynamic> fetchCategoryGroups() async {
    final String lang = languageService.currentLanguage; // الحصول على اللغة المختارة
    final String url = 'https://api-magazine.investinyemen.org/$lang/api/v1/category-group';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load category groups');
      }
    } catch (e) {
      rethrow;
    }
  }
}
