class AppLink {

  static const String server = "https://api-magazine.investinyemen.org/ar/api/v1/category-group";
//
  static const String categoryId = "https://api-magazine.investinyemen.org/ar/api/v1/single-category/";

  static const String signUp = "https://api-magazine.investinyemen.org/";

}
class ApiEndPoints {
  static final String baseUrl = 'https://10.0.2.2:7055/api/';
  static final String fuck = 'https://api.openweathermap.org/data/2.5/forecast?appid=18487de2da863a0aa945a09e42a89e8f&q=sanaa';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static const String test = "https://api-magazine.investinyemen.org/ar/api/v1/single-category/11";
}

class _AuthEndPoints {
  final String registerEmail = 'https://';
  final String loginEmail = 'Auth/login';
  final String homePage = 'Category';
  final String product = 'Item';
  final String cart = 'Cart/Quantity';
  final String cartBy = 'Cart/';

  final String cartByQuantity = 'Cart/Quantity/';
  final String addressBy = 'Address/';
  final String address = 'Address';
  final String order = 'Order';
  final String orderUserId = 'Order/';
  final String orderId = 'Order/Id/';
  final String rating = 'Rating';

}