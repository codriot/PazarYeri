import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/feature/profile/profile/model/Profile_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';

class ProfileViewModel {
  List<ProfileModel> profiles = [
    ProfileModel(
        name: 'Cüzdanım', icon: Icons.wallet, route: Navigate.wallet.route),
    ProfileModel(
        name: 'Geçmiş Siparişlerim',
        icon: Icons.list_alt_outlined,
        route: Navigate.pastOrders.route),
    ProfileModel(
        name: 'Adreslerim',
        icon: Icons.location_on_outlined,
        route: Navigate.adress.route),
    ProfileModel(
        name: 'Kartlarım', icon: Icons.credit_card, route: Navigate.card.route),
    ProfileModel(
        name: 'Hesap Ayarları', icon: Icons.settings_outlined, route: 'Route2'),
    ProfileModel(
        name: 'Çıkış Yap',
        icon: Icons.login_rounded,
        route: Navigate.welcome.route),
  ];
}
