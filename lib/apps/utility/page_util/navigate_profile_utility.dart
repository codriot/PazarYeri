import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/Settings.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/adress_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/cards/cards_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/past_orders/past_orders_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/profile_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/profile/wallet_view.dart';

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
