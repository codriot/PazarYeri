part of 'auth_view.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final passwordViewModel = Get.find<PasswordViewModel>();

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
        selectedFillColor: Colors.transparent,
        activeFillColor: ColorsProject.apricotSorbet,
        activeColor: ColorsProject.apricotSorbet,
        inactiveFillColor: Colors.transparent,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {
        if (int.parse(v) == passwordViewModel.password.value) {
          passwordViewModel.checkPassword(int.parse(v));
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

class Countdown extends AnimatedWidget {
  const Countdown({required this.animation, super.key})
      : super(listenable: animation);
  final Animation<int> animation;

  @override
  Text build(BuildContext context) {
    final clockTimer = Duration(seconds: animation.value);

    final timerText =
        '${clockTimer.inMinutes.remainder(60)}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ColorsProject.apricotSorbet),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({required this.page, super.key, this.canGo = false});
  final bool canGo;
  final String page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            if (canGo) {
              Get.offAndToNamed(page);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
            child: Text(
              'Onayla',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
