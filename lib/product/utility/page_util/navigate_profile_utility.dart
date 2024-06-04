import 'package:flutter/material.dart';
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

GlobalKey<NavigatorState> wishListNavigatorKey = GlobalKey<NavigatorState>();

class ProfileNavigatorWidgetState extends State<ProfileNavigatorWidget> {
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
              return const AddressView();
            }
            if (settings.name == Navigate.card.route) {
              return const CardsView();
            }

            if (settings.name == Navigate.setting.route) {
              return const SettingsView();
            }

            return const ProfileView();
          },
        );
      },
    );
  }
}
