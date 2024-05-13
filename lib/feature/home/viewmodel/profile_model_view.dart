import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/feature/home/model/Profile_model.dart';

class ProfileViewModel {
  List<ProfileModel> profiles = [
    ProfileModel(name: 'Cüzdanım', icon: Icons.wallet, route: 'Route1'),
    ProfileModel(
        name: 'Geçmiş Siparişlerim',
        icon: Icons.list_alt_outlined,
        route: 'Route2'),
    ProfileModel(
        name: 'Adreslerim', icon: Icons.location_on_outlined, route: 'Route2'),
    ProfileModel(name: 'Kartlarım', icon: Icons.credit_card, route: 'Route2'),
    ProfileModel(
        name: 'Hesap Ayarları', icon: Icons.settings_outlined, route: 'Route2'),
    ProfileModel(name: 'Çıkış Yap', icon: Icons.login_rounded, route: 'Route2'),
  ];
}
