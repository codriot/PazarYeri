import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/address/view/adress_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/cards/view/cards_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/past_orders/view/past_orders_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/profile/view/profile_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/settings/Settings.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/wallet/view/wallet_view.dart';
import 'package:turkiye_yazilim_staj/feature/login/welcome/view/welcome_view.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  WishlistState createState() => WishlistState();
}

GlobalKey<NavigatorState> wishListNavigatorKey = GlobalKey<NavigatorState>();

class WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: wishListNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            if (settings.name == Navigate.wallet.route) {
              return const WalletView();
            }
            if (settings.name == Navigate.pastOrders.route) {
              return const PastOrdersView();
            }
            if (settings.name == Navigate.address.route) {
              return const AdressView();
            }
            if (settings.name == Navigate.card.route) {
              return const CardsView();
            }

            if (settings.name == Navigate.setting.route) {
              return const SettingsView();
            }
            if (settings.name == Navigate.welcome.route) {
              return const FirstLoginView();
            }

            return const ProfileView();
          },
        );
      },
    );
  }
}
















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:turkiye_yazilim_staj/feature/home/profile/address/adress_view.dart';
// import 'package:turkiye_yazilim_staj/feature/home/profile/cards/view/cards_view.dart';
// import 'package:turkiye_yazilim_staj/feature/home/profile/past_orders/view/past_orders_view.dart';
// import 'package:turkiye_yazilim_staj/feature/home/profile/profile/view/profile_view.dart';
// import 'package:turkiye_yazilim_staj/feature/home/profile/wallet/view/wallet_view.dart';
// import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';

// class Wishlist extends StatefulWidget {
//   const Wishlist({super.key});

//   @override
//   WishlistState createState() => WishlistState();
// }

// GlobalKey<NavigatorState> wishListNavigatorKey = GlobalKey<NavigatorState>();

// class WishlistState extends State<Wishlist> {
//   @override
//   Widget build(BuildContext context) {
//     return GetNavigator(
//       key: wishListNavigatorKey,
//       pages: [
//         GetPage(
//           name: Navigate.wallet.route,
//           page: () => const WalletView(),
//         ),
//         GetPage(
//           name: Navigate.pastOrders.route,
//           page: () => const PastOrdersView(),
//         ),
//         GetPage(
//           name: Navigate.adress.route,
//           page: () => const AdressView(),
//         ),
//         GetPage(
//           name: Navigate.card.route,
//           page: () => const CardsView(),
//         ),
//         // GetPage(name: Navigate.Settings, page: page)
//         GetPage(
//           name: Navigate.profile.route,
//           page: () => const ProfileView(),
//         ),
//       ],
//     );
//   }
// }















