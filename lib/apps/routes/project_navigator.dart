// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/bindings/project_bindings.dart';
import 'package:turkiye_yazilim_staj/apps/routes/profile_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/storage/storage_util.dart';
import 'package:turkiye_yazilim_staj/apps/views/Influencer_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/cart/cart_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/favourite_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/home_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/login/auth/auth_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/login/new_profile_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/login/welcome/welcome_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/navigation_bar_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/notification_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/payment_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/product/product_comment_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/product/product_detail/product_detail_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/product/product_search/search_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/product/product_search_result/search_result_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/Settings.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/adress_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/cards/cards_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/past_orders/past_orders_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/profile_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/wallet_view.dart';

mixin NavigateMixin {
  static const String init = '/';

  /// Routes for the application
  /// if user is not logged in, navigate to registration form
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: NavigateMixin.init,
      page: () => StorageUtil().getUserId() == 0
          ? const FirstLoginView()
          : const NavigationBarView(),
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
    GetPage(
      name: Navigate.main.route,
      page: () => const NavigationBarView(),
      bindings: [MainNavigatorBinding()],
    ),
    GetPage(name: Navigate.welcome.route, page: () => const FirstLoginView()),
    GetPage(name: Navigate.signup.route, page: () => const RegistrationForm()),
    GetPage(name: Navigate.auth.route, page: () => const VerifyPage()),
    GetPage(
      name: Navigate.pastOrders.route,
      page: () => const PastOrdersView(),
    ),
    GetPage(name: Navigate.address.route, page: () => const AddressView()),
    GetPage(name: Navigate.card.route, page: () => const CardsView()),
    GetPage(
      name: Navigate.search.route,
      page: () => const SearchView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(name: Navigate.setting.route, page: () => const SettingsView()),
    GetPage(
      name: Navigate.allComment.route,
      page: () => const AllCommentView(),
    ),
    GetPage(
      name: Navigate.influencer.route,
      page: () => const InfluencerView(),
    ),
    GetPage(
      name: Navigate.notification.route,
      page: () => const NotificationView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Navigate.searchResult.route,
      page: SearchResultView.new,
    ),
    GetPage(
      name: Navigate.profile.route,
      page: () => const ProfileNavigator(), // Nested Navigator burada başlıyor
      children: [
        GetPage(name: Navigate.wallet.route, page: () => const WalletView()),
        GetPage(
          name: Navigate.pastOrders.route,
          page: () => const PastOrdersView(),
        ),
        GetPage(name: Navigate.address.route, page: () => const AddressView()),
        GetPage(name: Navigate.card.route, page: () => const CardsView()),
        GetPage(name: Navigate.setting.route, page: () => const SettingsView()),
      ],
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
  allComment,
  payment,
  searchResult,
  influencer
}

extension NavigateExtension on Navigate {
  String get route => '/$name';
}
