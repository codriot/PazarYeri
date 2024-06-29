import 'package:get/get.dart';

class PrivacyPolicyController extends GetxController {
  RxBool isChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    isChecked.value = false;
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
    update();
  }
}
