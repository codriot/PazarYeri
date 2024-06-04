import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:turkiye_yazilim_staj/feature/login/authentication/controller/authentication_controller.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/image/assets.gen.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_app_bar.dart';

part 'parts/auth_part.dart';
part 'parts/pin_code_widget.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> with TickerProviderStateMixin {
  final int _counter = 0;
  late AnimationController _controller;
  int levelClock = 180;
  final PasswordController controller = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.backgroundImage.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const CustomAppBarBuilder(
                hasNotificationButton: false,
              ),
              _verificationText(),
              const PinCode(),
              _countDownText(),
              _newVerificationCodeButton(),
              NextButton(
                page: Navigate.signup.route,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: levelClock),
    );

    _controller.forward();
    // bildirim gönder
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        'Telefon Onay Mesajı',
        'Doğrulama kodunuz: ${controller.password}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        colorText: ColorsProject.apricotSorbet,
        duration: const Duration(seconds: 5),
      );
    });
  }

  TextButton _newVerificationCodeButton() {
    return TextButton(
      onPressed: () {
        if (_counter == 0) {
          controller.generatePassword();
          Get.snackbar(
            'Telefon Onay Mesajı',
            'Doğrulama kodunuz: ${controller.password}',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: ColorsProject.apricotSorbet,
            duration: const Duration(seconds: 5),
          );
        }
      },
      child: const Text(
        'yeni kod gönder',
        style: TextStyle(color: ColorsProject.apricotSorbet),
      ),
    );
  }

  Padding _verificationText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 70),
      child: Text('Doğrulama kodunu giriniz,'),
    );
  }

  Row _countDownText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Yeni doğrulama kodu almak icin :  ',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: ColorsProject.grey,
              ),
        ),
        Countdown(
          animation: StepTween(
            begin: levelClock, // BU 3 DAKİKALIK SAYACIN BAŞLANGICIDIR
            end: 0,
          ).animate(_controller),
        ),
      ],
    );
  }
}
