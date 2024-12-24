import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:posts/linkapi.dart';
import 'package:posts/models/product_model.dart';
class ProductDiscountServices{

  static var client = http.Client();
  static Future<List<ProductModel>?> getProductDiscount() async{

    var response = await client.get(Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.product));
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