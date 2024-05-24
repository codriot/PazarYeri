import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/util/func/generate_password.dart';

class PasswordViewModel extends GetxController {
  var password = generateRandomPassword(6).obs;
  var isVerified = false.obs;
  void generatePassword() {
    password.value = generateRandomPassword(6);
    update();
  }

  void checkPassword(int value) {
    if (value == password.value) {
      isVerified.value = true;
    } else {
      isVerified.value = false;
    }
    update();
  }
}
