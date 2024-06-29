import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/apps/models/profile/Profile_model.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';

class ProfileController {
  List<ProfileModel> profiles = [
    ProfileModel(
      name: 'Cüzdanım',
      icon: Icons.wallet,
      route: Navigate.wallet.route,
    ),
    ProfileModel(
      name: 'Geçmiş Siparişlerim',
      icon: Icons.list_alt_outlined,
      route: Navigate.pastOrders.route,
    ),
    ProfileModel(
      name: 'Adreslerim',
      icon: Icons.location_on_outlined,
      route: Navigate.address.route,
    ),
    ProfileModel(
      name: 'Kartlarım',
      icon: Icons.credit_card,
      route: Navigate.card.route,
    ),
    ProfileModel(
      name: 'Hesap Ayarları',
      icon: Icons.settings_outlined,
      route: Navigate.setting.route,
    ),
    ProfileModel(
      name: 'Çıkış Yap',
      icon: Icons.login_rounded,
      route: Navigate.welcome.route,
      canBack: false,
    ),
  ];
}
