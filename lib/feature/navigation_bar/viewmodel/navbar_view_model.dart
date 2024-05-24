// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';

/// This class is responsible for navigation bar controller
class NavBarController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxInt innerTabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void changeInnerTabIndex(int index) {
    innerTabIndex.value = index;
  }
}
