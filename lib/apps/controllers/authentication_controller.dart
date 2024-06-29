import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/mixin/generate_password.dart';

/// PasswordController is a GetxController class that is responsible for
/// generating a random password and checking if the password is correct.
class PasswordController extends GetxController {
  RxInt password = GeneratePassword.generateRandomPassword(6).obs;
  RxBool isVerified = false.obs;
  void generatePassword() {
    password.value = GeneratePassword.generateRandomPassword(6);
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
