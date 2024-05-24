part of 'auth_view.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    PasswordViewModel passwordViewModel = Get.find();

    final TextEditingController controller = TextEditingController();
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      controller: controller,
      appContext: context,
      length: 6, // the number of boxes
      obscureText: false,
      animationType: AnimationType.fade,
      // hintStyle: const TextStyle(color: Colors.amber),
      textStyle: const TextStyle(color: Colors.white),
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          //todo: fix this shape
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 70,
          fieldWidth: 60,
          selectedFillColor: Colors.transparent,
          activeFillColor: ColorsProject.apricotSorbet,
          activeColor: ColorsProject.apricotSorbet,
          inactiveFillColor: Colors.transparent),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {
        if (int.parse(v) == passwordViewModel.password.value) {
          passwordViewModel.checkPassword(int.parse(v));
          Get.snackbar("Başarılı", "Doğrulama başarılı",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.white,
              colorText: ColorsProject.apricotSorbet,
              duration: const Duration(seconds: 5));
        } else {
          Get.snackbar("Hata", "Doğrulama kodu hatalı",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.white,
              colorText: ColorsProject.apricotSorbet,
              duration: const Duration(seconds: 5));
        }
      },
    );
  }
}

class Countdown extends AnimatedWidget {
  const Countdown({super.key, required this.animation})
      : super(listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ColorsProject.apricotSorbet),
    );
  }
}
