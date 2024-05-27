// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/home/Home/view/home.dart';
import 'package:turkiye_yazilim_staj/feature/home/Notification/view/notification_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/cart/cart/view/cart_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/cart/payment/view/payment_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/favourite/view/favourite_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/influencer/view/Influencer.dart';
import 'package:turkiye_yazilim_staj/feature/home/navigation_bar/view/navigation_bar.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/address/view/adress_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/cards/view/cards_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/past_orders/view/past_orders_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/profile/view/profile_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/settings/Settings.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/wallet/view/wallet_view.dart';
import 'package:turkiye_yazilim_staj/feature/login/authentication/view/auth_view.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/view/login_third.dart';
import 'package:turkiye_yazilim_staj/feature/login/welcome/view/welcome_view.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/view/all_comment.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/view/product_detail.dart';
import 'package:turkiye_yazilim_staj/feature/product/search/view/search_view.dart';
import 'package:turkiye_yazilim_staj/product/util/storage/storage_util.dart';

mixin NavigateMixin {
  static const String init = '/';

  /// Routes for the application
  /// if user is not logged in, navigate to registration form
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: NavigateMixin.init,
      page: () => StorageUtil().getUserId() == 0
          ? const FirstLoginView()
          : const NavbarView(),
    ),
    GetPage(name: Navigate.home.route, page: () => const HomeView()),
    GetPage(name: Navigate.favorite.route, page: () => const FavoriteView()),
    GetPage(name: Navigate.cart.route, page: () => const CartView()),
    GetPage(
      name: Navigate.profile.route,
      page: () => const ProfileView(),
    ),
    GetPage(name: Navigate.wallet.route, page: () => const WalletView()),
    GetPage(name: Navigate.payment.route, page: PaymentView.new),
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
    GetPage(name: Navigate.address.route, page: () => const AdressView()),
    GetPage(name: Navigate.card.route, page: () => const CardsView()),
    GetPage(name: Navigate.search.route, page: () => const SearchView()),
    GetPage(name: Navigate.setting.route, page: () => const SettingsView()),
    GetPage(
      name: Navigate.allcomment.route,
      page: () => const AllCommentView(),
    ),
    GetPage(
      name: Navigate.influencer.route,
      page: () => const InfluencerView(),
    ),
    GetPage(
      name: Navigate.notification.route,
      page: () => const NotificationView(),
    ),
  ];
}

enum Navigate {
  cart,
  favorite,
  home,
  welcome,
  signup,
  auth,
  main,
  productDetail,
  profile,
  address,
  card,
  pastOrders,
  wallet,
  notification,
  search,
  setting,
  allcomment,
  payment,
  influencer
}

extension NavigateExtension on Navigate {
  String get route {
    switch (this) {
      case Navigate.cart:
        return '/CartView';
      case Navigate.favorite:
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
      case Navigate.address:
        return '/address';
      case Navigate.card:
        return '/card';
      case Navigate.pastOrders:
        return '/pastOrders';
      case Navigate.wallet:
        return '/wallet';
      case Navigate.search:
        return '/search';
      case Navigate.setting:
        return '/setting';
      case Navigate.allcomment:
        return '/allcomment';
      case Navigate.payment:
        return '/payment';
      case Navigate.influencer:
        return '/influencer';
      case Navigate.notification:
        return '/notification';
    }
  }
}
