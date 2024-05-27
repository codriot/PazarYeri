import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/home/cart/payment/view_model/payment_view_model.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentViewModel());
    return const Scaffold(
      appBar: CustomAppBar(colorsAppBar: Colors.white),
      body: Center(
        child: Text('Payment View'),
      ),
    );
  }
}
