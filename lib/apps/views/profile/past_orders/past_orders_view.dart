import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/profile/past_orders_controller.dart';
import 'package:turkiye_yazilim_staj/apps/models/product_model.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/mixin/custom_gradient.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/general_app_bar.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/search_bar_general.dart';

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
