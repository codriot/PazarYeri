import 'package:flutter/material.dart';

class ProfileModel {
  ProfileModel({
    required this.name,
    required this.icon,
    required this.route,
    this.canBack = true,
  });
  String name;
  IconData icon;
  String route;
  bool canBack;
}
