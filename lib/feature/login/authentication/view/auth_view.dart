import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:turkiye_yazilim_staj/feature/login/authentication/viewmodel/auth_view_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';
import 'package:turkiye_yazilim_staj/product/widget/next_page_button.dart';

part 'auth_part.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> with TickerProviderStateMixin {
  final int _counter = 0;
  late AnimationController _controller;
  int levelClock = 180;
  final PasswordViewModel _passwordViewModel = Get.put(PasswordViewModel());

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));

    _controller.forward();
    // bildirim gönder
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar("Telefon Onay Mesajı",
          "Doğrulama kodunuz: ${_passwordViewModel.password}",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: ColorsProject.apricotSorbet,
          duration: const Duration(seconds: 5));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isWhite: true, isTransparent: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _verificationText(),
            const PinCode(),
            _countDownText(),
            _newVerificationCodeButton(),
            NextButton(
              canGo: _passwordViewModel.isVerified.value,
              page: Navigate.signup.route,
            )
          ],
        ),
      ),
    );
  }

  TextButton _newVerificationCodeButton() {
    return TextButton(
        onPressed: () {
          if (true) {
            _passwordViewModel.generatePassword();
            Get.snackbar("Telefon Onay Mesajı",
                "Doğrulama kodunuz: ${_passwordViewModel.password}",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.white,
                colorText: ColorsProject.apricotSorbet,
                duration: const Duration(seconds: 5));
          }
        },
        child: const Text(
          "yeni kod gönder",
          style: TextStyle(color: ColorsProject.apricotSorbet),
        ));
  }

  Padding _verificationText() {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 70),
        child: Text("Doğrulama kodunu giriniz,"));
  }

  Row _countDownText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Yeni doğrulama kodu almak icin :  "),
        Countdown(
          animation: StepTween(
            begin: levelClock, // BU KULLANICININ GİRDİĞİ BİR NUMARADIR
            end: 0,
          ).animate(_controller),
        )
      ],
    );
  }
}
