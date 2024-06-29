import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/cart_controller.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/favourite_controller.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/home_controller.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/navigation_bar_controller.dart';

class MainNavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<NavBarController>(NavBarController())
      ..lazyPut<HomeController>(() {
        return HomeController();
      })
      ..lazyPut<CartController>(() {
        return CartController();
      })
      ..lazyPut<FavoriteController>(() {
        return FavoriteController();
      });
  }
}
