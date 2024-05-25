import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/cart/view/cart_view.dart';
import 'package:turkiye_yazilim_staj/feature/favourite/favourite_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/view/home.dart';
import 'package:turkiye_yazilim_staj/feature/login/authentication/view/auth_view.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/view/login_third.dart';
import 'package:turkiye_yazilim_staj/feature/login/welcome/view/welcome_view.dart';
import 'package:turkiye_yazilim_staj/feature/navigation_bar/view/navigation_bar.dart';
import 'package:turkiye_yazilim_staj/feature/product_detail/view/product_detail.dart';
import 'package:turkiye_yazilim_staj/feature/profile/address/adress_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/cards/view/cards_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/past_orders/view/past_orders_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/profile/view/profile_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/wallet/view/wallet_view.dart';
import 'package:turkiye_yazilim_staj/feature/search/view/search_view.dart';
import 'package:turkiye_yazilim_staj/product/util/storage/storage_util.dart';

mixin NavigateMixin {
  static const String init = '/';
  //todo: init sayfası eğer kullanıcı giriş yapmamışsa welcome view olacak giriş yapmışsa navbarview view olacak
  /// Routes for the application
  /// if user is not logged in, navigate to registration form
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: NavigateMixin.init,
      page: () => StorageUtil().getUserId() == 0
          ? const RegistrationForm()
          : const NavbarView(),
    ), //todo: change to welcome view later
    GetPage(name: Navigate.home.route, page: () => const HomeView()),
    GetPage(name: Navigate.favourite.route, page: () => const FavouriteView()),
    GetPage(name: Navigate.cart.route, page: () => const CartView()),
    GetPage(name: Navigate.profile.route, page: () => const ProfileView()),
    GetPage(name: Navigate.wallet.route, page: () => const WalletView()),
    // GetPage(name: Navigate.payment.route, page: () => PaymentView()),  Dümenden sayfa oluştur
    GetPage(
      name: Navigate.productDetail.route,
      page: () => const ProductDetailView(),
    ),
    GetPage(name: Navigate.main.route, page: () => const NavbarView()),
    GetPage(name: Navigate.welcome.route, page: () => const FirstLoginView()),
    GetPage(name: Navigate.signup.route, page: () => const RegistrationForm()),
    GetPage(name: Navigate.auth.route, page: () => const VerifyPage()),
    GetPage(
      name: Navigate.pastOrders.route,
      page: () => const PastOrdersView(),
    ),
    GetPage(name: Navigate.adress.route, page: () => const AdressView()),
    GetPage(name: Navigate.card.route, page: () => const CardsView()),
    GetPage(name: Navigate.search.route, page: () => const SearchView()),
  ];
}

enum Navigate {
  cart,
  favourite,
  home,
  welcome,
  signup,
  auth,
  main,
  productDetail,
  profile,
  adress,
  card,
  pastOrders,
  wallet,
  search
}

extension NavigateExtension on Navigate {
  String get route {
    switch (this) {
      case Navigate.cart:
        return '/CartView';
      case Navigate.favourite:
        return '/FavouriteView';
      case Navigate.home:
        return '/HomeView';
      case Navigate.welcome:
        return '/FirstLoginView';
      case Navigate.signup:
        return '/RegistrationForm';
      case Navigate.auth:
        return '/VerifyPage';
      case Navigate.main:
        return '/main';
      case Navigate.productDetail:
        return '/productDetail';
      case Navigate.profile:
        return '/profile';
      case Navigate.adress:
        return '/adress';
      case Navigate.card:
        return '/card';
      case Navigate.pastOrders:
        return '/pastOrders';
      case Navigate.wallet:
        return '/wallet';
      case Navigate.search:
        return '/search';
    }
  }
}
