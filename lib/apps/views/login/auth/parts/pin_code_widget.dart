part of '../auth_view.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final passwordController = Get.find<PasswordController>();

    final controller = TextEditingController();
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      controller: controller,
      appContext: context,
      length: 6, // the number of boxes
      animationType: AnimationType.fade,
      textStyle: const TextStyle(color: Colors.white),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(15),
        fieldHeight: 70,
        fieldWidth: 60,
        disabledBorderWidth: 2,
        activeBorderWidth: 2,
        inactiveColor: ColorsProject.apricotSorbet,
        selectedFillColor: Colors.transparent,
        activeFillColor: ColorsProject.apricotSorbet,
        activeColor: ColorsProject.apricotSorbet,
        inactiveFillColor: Colors.transparent,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {
        if (int.parse(v) == passwordController.password.value) {
          passwordController.checkPassword(int.parse(v));
          Get.snackbar(
            'Başarılı',
            'Doğrulama başarılı',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: ColorsProject.apricotSorbet,
            duration: const Duration(seconds: 5),
          );
        } else {
          Get.snackbar(
            'Hata',
            'Doğrulama kodu hatalı',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: ColorsProject.apricotSorbet,
            duration: const Duration(seconds: 5),
          );
        }
      },
    );
  }
}
