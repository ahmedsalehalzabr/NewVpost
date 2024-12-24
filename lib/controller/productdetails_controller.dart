import 'dart:convert';

import 'package:posts/core/services/address_services.dart';
import 'package:posts/core/services/cart_services.dart';
import 'package:posts/core/services/services.dart';
import 'package:posts/linkapi.dart';
import 'package:posts/models/addtess_model.dart';
import 'package:posts/models/cart_model.dart';
import 'package:posts/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class Catalog2Controller extends GetxController {
  var isLoading = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  CityModel? cgModel;
  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          ApiEndPoints.fuck)!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        print(result);

        cgModel = CityModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ProductModel productModel;




  intialData() {
    productModel = Get.arguments['itemsmodel'];
   // quantity = productModel.quantity ?? 0;
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];
  var id;

  var cartList = <CartModel>[].obs;

 // var cityList = <CityModel>[].obs;
  var isLoading = true.obs;


  MyServices myServices = Get.find();

  void addCarts(String? id) async {
    if (id == null) {
      print("ID is null, cannot add");
      return;
    }
    update();
    try {
      isLoading(true);
      List<CartModel>? cartItem = await CartServices.addCart(id, myServices.sharedPreferences.getString("id")!);
      if (cartItem != null ) {

        cartList.addAll(cartItem);
        Get.rawSnackbar(
            title: "اشعار",
            message : "تم اضافة المنتج الى السلة ");
      }
    } finally {
      isLoading(false);
    }
    update();
  }
// هذا الكود نفس الي فوق لاكن لو الطلب من ابجكت وليس من لست
  //var cityList = <CityModel>[].obs;






  void deleteByItemId(String? id) async {
    if (id == null) {
      print("ID is null, cannot delete");
      return;
    }
    update();
    try {
      isLoading(true);
      // تحويل id إلى Guid
      String itemId = id;
      String userId = myServices.sharedPreferences.getString("id")!;

      CartModel? updatedCart = await CartServices.deleteCartItem(itemId, userId);
      if (updatedCart != null) {
        // تحديث cartList بالقائمة الجديدة
        cartList.remove(itemId);
        // cartList.addAll(updatedCart.items as Iterable<CartModel>);
        Get.rawSnackbar(
            title: "اشعار",
            message: "تم ازالة المنتج من السلة ");
      } else {
        print("فشل في حذف العنصر");
      }
    } catch (e) {
      print("خطأ أثناء الحذف: $e");
    } finally {
      isLoading(false);
      print("عملية الحذف انتهت");
    }
    update();
  }

int quantity = 0;

// add() {
//   addCarts(productModel.id);
//   quantity++;
//   update();
// }
//
// remove() {
//   if (quantity > 0) {
//     deleteByItemId(productModel.id);
//     quantity--;
//     update();
//   }






  @override
  void onInit() {
    intialData();

    // addCarts(id);
    // deleteByItemId(id);

    super.onInit();
  }
}