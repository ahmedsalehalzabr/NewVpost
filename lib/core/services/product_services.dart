import 'dart:convert';

import 'package:posts/linkapi.dart';
import 'package:posts/models/product_model.dart';
import 'package:http/http.dart' as http;
class ProductServices{

  static var client = http.Client();
  static Future<List<ProductModel>?> getProduct() async{

    var response = await client.get(Uri.parse(ApiEndPoints.test));
    if(response.statusCode == 200)
    {
      var convertedJosnData = jsonDecode(response.body);
      return (convertedJosnData as List).map((e) => ProductModel.fromJson(e)).toList();
    }
    else
    {
      return null;
    }

  }

}