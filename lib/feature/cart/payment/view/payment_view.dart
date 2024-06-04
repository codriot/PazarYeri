import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/cart/payment/controller/payment_controller.dart';
import 'package:turkiye_yazilim_staj/product/widget/general_app_bar.dart';

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
