import 'dart:convert';
import 'package:posts/linkapi.dart';
import 'package:posts/models/cart_model.dart';
import 'package:http/http.dart' as http;


class CartServices{

  static var client = http.Client();

  static Future<List<CartModel>?> getCart() async{

    var response = await client.get(Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.cart));
    if(response.statusCode == 200)
    {
      var convertedJosnData = jsonDecode(response.body);
      return (convertedJosnData as List).map((e) => CartModel.fromJson(e)).toList();
    }
    else
    {
      return null;
    }
  }



  static Future<bool> deleteCart(String id) async {
    var response = await client.delete(Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.cartBy + "$id"));
    return response.statusCode == 200;
  }




  static Future<List<CartModel>?> getCartByUserId(String userId) async{

    var response = await client.get(Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.cartBy}$userId"));
    if(response.statusCode == 200)
    {
      var convertedJosnData = jsonDecode(response.body);
      return (convertedJosnData as List).map((e) => CartModel.fromJson(e)).toList();
    }
    else
    {
      return null;
    }
  }




  static Future<List<CartModel>?> addCart(String id, String userId) async {
    Map<String, dynamic> requestBody = {
      'userId': userId,
      'items': [id],
    };

    var response = await client.post(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.cart),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
    // إضافة طباعة لمحتوى الاستجابة
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode == 200) {
      var convertedJsonData = jsonDecode(response.body);
      if (convertedJsonData is List) {
        return (convertedJsonData).map((e) => CartModel.fromJson(e)).toList();
      }
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return null;
    }
  }

  static Future<CartModel?> addCartItem(String id, String userId) async {
    // تأكد من أن الجسم يحتوي على البيانات المطلوبة
    var requestBody = {
      'userId': userId,
      'items': [id], // افترض أن السلة تستقبل قائمة من العناصر
    };

    var response = await http.post(
      Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.cart}"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody), // استخدام الجسم المعدل
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return CartModel.fromJson(responseData);
    } else {
      print("Failed to add item: ${response.statusCode} - ${response.body}");
      return null;
    }
  }

  static Future<CartModel?> deleteCartItem(String itemId, String userId) async {
    var response = await http.delete(
      Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.cartByQuantity}$itemId"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userId),
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return CartModel.fromJson(responseData);
    } else {
      print("Failed to delete item: ${response.statusCode}");
      return null;
    }
  }

  }


