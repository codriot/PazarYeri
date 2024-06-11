import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/profile/address/view/adress_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/cards/view/cards_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/past_orders/view/past_orders_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/profile/view/profile_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/settings/view/Settings.dart';
import 'package:turkiye_yazilim_staj/feature/profile/wallet/view/wallet_view.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';

class ProfileNavigatorWidget extends StatefulWidget {
  const ProfileNavigatorWidget({super.key});

  @override
  ProfileNavigatorWidgetState createState() => ProfileNavigatorWidgetState();
}

// GlobalKey<NavigatorState> wishListNavigatorKey = GlobalKey<NavigatorState>();
// final Key wishListNavigatorKey = UniqueKey();

class ProfileNavigatorWidgetState extends State<ProfileNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: Navigate.profile.route,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == Navigate.wallet.route) {
          return GetPageRoute(page: () => const WalletView()); //
        }
        if (settings.name == Navigate.pastOrders.route) {
          return GetPageRoute(page: () => const PastOrdersView()); //
        }
        if (settings.name == Navigate.address.route) {
          return GetPageRoute(page: () => const AddressView()); //
        }
        if (settings.name == Navigate.card.route) {
          return GetPageRoute(page: () => const CardsView()); //
        }
        if (settings.name == Navigate.setting.route) {
          return GetPageRoute(page: () => const SettingsView());
        }

        return GetPageRoute(page: () => const ProfileView());
      },
    );
  }
}
