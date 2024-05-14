import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/view/login_third.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/next_page_button.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> with TickerProviderStateMixin {
  final int _counter = 0;
  late AnimationController _controller;
  int levelClock = 180;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAZARYERİ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _verification_text(),
            const PinCode(),
            _countDownText(),
            _newVerificationCodeButton(),
            const NextButton(
              page: RegistrationForm(),
              isreturn: false,
            )
          ],
        ),

        //Todo: 3. sayfaya git NextButton()
      ),
    );
  }

  TextButton _newVerificationCodeButton() {
    return TextButton(
        onPressed: () {},
        child: const Text(
          "yeni kod gönder",
          style: TextStyle(color: ColorsProject.apricotSorbet),
        ));
  }

  Padding _verification_text() {
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
            begin: levelClock, // THIS IS A USER ENTERED NUMBER
            end: 0,
          ).animate(_controller),
        )
      ],
    );
  }
}

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
          activeFillColor: ColorsProject.apricotSorbet,
          activeColor: ColorsProject.apricotSorbet,
          inactiveFillColor: Colors.transparent),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
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

    print('animation.value  ${animation.value} ');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print(
        'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      timerText,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ColorsProject.apricotSorbet),
    );
  }
}
