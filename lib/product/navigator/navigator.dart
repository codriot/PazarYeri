import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/Home/view/home.dart';
import 'package:turkiye_yazilim_staj/feature/Notification/view/notification_view.dart';
import 'package:turkiye_yazilim_staj/feature/cart/cart/view/cart_view.dart';
import 'package:turkiye_yazilim_staj/feature/cart/payment/view/payment_view.dart';
import 'package:turkiye_yazilim_staj/feature/favourite/view/favourite_view.dart';
import 'package:turkiye_yazilim_staj/feature/influencer/view/Influencer.dart';
import 'package:turkiye_yazilim_staj/feature/login/authentication/view/auth_view.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/view/new_profile_view.dart';
import 'package:turkiye_yazilim_staj/feature/login/welcome/view/welcome_view.dart';
import 'package:turkiye_yazilim_staj/feature/navigation_bar/view/navigation_bar.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_comment/view/product_comment_view.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/view/product_detail.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_search/view/search_view.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_search_result/view/search_result_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/address/view/adress_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/cards/view/cards_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/past_orders/view/past_orders_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/profile/view/profile_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/settings/view/Settings.dart';
import 'package:turkiye_yazilim_staj/feature/profile/wallet/view/wallet_view.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/storage/storage_util.dart';

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
    GetPage(name: Navigate.main.route, page: () => const NavigationBarView()),
    GetPage(name: Navigate.welcome.route, page: () => const FirstLoginView()),
    GetPage(name: Navigate.signup.route, page: () => const RegistrationForm()),
    GetPage(name: Navigate.auth.route, page: () => const VerifyPage()),
    GetPage(
      name: Navigate.pastOrders.route,
      page: () => const PastOrdersView(),
    ),
    GetPage(name: Navigate.address.route, page: () => const AddressView()),
    GetPage(name: Navigate.card.route, page: () => const CardsView()),
    GetPage(name: Navigate.search.route, page: () => const SearchView()),
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
    ),
    GetPage(
      name: Navigate.searchResult.route,
      page: SearchResultView.new,
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
