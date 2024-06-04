import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/profile/past_orders/controller/past_orders_controller.dart';
import 'package:turkiye_yazilim_staj/product/model/product_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/mixin/custom_gradient.dart';
import 'package:turkiye_yazilim_staj/product/widget/general_app_bar.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar_general.dart';

part 'part/order_history_cart.dart';

class PastOrdersView extends StatelessWidget {
  const PastOrdersView({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PastOrdersController());
    return Scaffold(
      appBar: const GeneralAppBar(colorsAppBar: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const GeneralSearchBar(
              hintText: 'Ara...',
            ),
            const Spacer(),
            Expanded(
              flex: 18,
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.pastOrders!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return OrderHistoryCard(
                            productModel: controller.pastOrders![index],
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
