import 'dart:convert';
import 'dart:ffi';
import 'package:posts/linkapi.dart';
import 'package:posts/models/addtess_model.dart';
import 'package:http/http.dart' as http;


class AddressServices{

  static var client = http.Client();

  // static Future<List<CartModel>?> getCart() async{
  //
  //   var response = await client.get(Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.cart));
  //   if(response.statusCode == 200)
  //   {
  //     var convertedJosnData = jsonDecode(response.body);
  //     return (convertedJosnData as List).map((e) => CartModel.fromJson(e)).toList();
  //   }
  //   else
  //   {
  //     return null;
  //   }
  // }



  // static Future<bool> deleteCart(String id) async {
  //   var response = await client.delete(Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.cartBy + "$id"));
  //   return response.statusCode == 200;
  // }




  // static Future<List<AddressModel>?> getCartByUserId(String userId) async{
  //
  //   var response = await client.get(Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.addressBy + "$userId"));
  //   if(response.statusCode == 200)
  //   {
  //     var convertedJosnData = jsonDecode(response.body);
  //     return (convertedJosnData as List).map((e) => AddressModel.fromJson(e)).toList();
  //   }
  //   else
  //   {
  //     return null;
  //   }
  // }

 // هذا الكود نفس الي فوق بس لو كان مش لست يعني ابجكت ماب
   static Future<CityModel?> getCity() async {
    try {
      var response = await client.get(Uri.parse(ApiEndPoints.fuck));
      if (response.statusCode == 200) {
        var convertedJsonData = jsonDecode(response.body);
        return CityModel.fromJson(convertedJsonData);
      } else {
        print("خطأ في الاستجابة: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("حدث خطأ أثناء طلب البيانات: $e");
      return null;
    }
  }


//
  //
  // static Future<AddressModel?> addAddressItem(String userId, String name, String city, String street) async {
  //
  //   var requestBody = {
  //     'userId': userId,
  //     'name': name,
  //     'city': city,
  //     'street': street,
  //     // 'lat': lat,
  //     // 'long': long,
  //   };
  //
  //   var response = await http.post(
  //     Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.address}"),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(requestBody),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);
  //     return AddressModel.fromJson(responseData);
  //   } else {
  //     print("Failed to add item: ${response.statusCode} - ${response.body}");
  //     return null;
  //   }
  // }
  //
  //
  // static Future<AddressModel?> deleteCartItem(String id, String userId) async {
  //   var response = await http.delete(
  //     Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.addressBy}${id}/${userId}"),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   );
  //
  //   print("Response status: ${response.statusCode}, body: ${response.body}");
  //
  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);
  //     return AddressModel.fromJson(responseData);
  //   } else {
  //     print("Failed to delete item: ${response.statusCode}");
  //     return null;
  //   }
  // }

}


