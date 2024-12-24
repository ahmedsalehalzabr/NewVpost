
import 'package:posts/view/screen/favorite_screen.dart';
import 'package:posts/view/screen/homescreen.dart';
import 'package:posts/view/screen/language.dart';
import 'package:posts/view/screen/search_screen.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screen/category_page.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),

  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.vvv, page: () => const Language()),

  GetPage(name: AppRoute.searchScreen, page: () =>  SearchScreen()),
  GetPage(name: AppRoute.categorypage, page: () =>  CategoryPage()),
  GetPage(name: AppRoute.favoriteScreen, page: () =>  const FavoriteScreen()),

];

class ForgetPassword {
  const ForgetPassword();
}
 