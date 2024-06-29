import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/payment_controller.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/general_app_bar.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    return const Scaffold(
      appBar: GeneralAppBar(colorsAppBar: Colors.white),
      body: Center(
        child: Text('Payment View'),
      ),
    );
  }
}
