import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/cart/cart/controller/cart_controller.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/comment_ui.dart';
import 'package:turkiye_yazilim_staj/product/widget/general_app_bar.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar_general.dart';

part 'part/cart_part_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Scaffold(
      appBar: const GeneralAppBar(colorsAppBar: Colors.white),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.productsList != null) {
                return _cartList(controller);
              } else {
                return const SizedBox();
              }
            }),
          ),
          Expanded(
            child: _completeShopping(context, controller),
          ),
        ],
      ),
    );
  }

  Padding _cartList(CartController controller) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height * 0.03,
        left: Get.height * 0.02,
        right: Get.height * 0.02,
      ),
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: GeneralSearchBar(
              hintText: 'favorilerde ara...',
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 20,
            child: ListView.builder(
              itemCount: controller.productsList?.length,
              itemBuilder: (BuildContext context, int index) {
                //burada favori ürünlerin listeleneceği widget olacak
                return GestureDetector(
                  onTap: () {
                    controller.goDetail(controller.productsList?[index]);
                  },
                  child: _ProductCard(
                    productPhoto: controller.productsList?[index].image,
                    productName: controller.productsList?[index].name,
                    productPrice: controller.productsList?[index].price,
                    sellerName: controller.productsList?[index].dealer,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _completeShopping(BuildContext context, CartController controller) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('368,00₺', style: Theme.of(context).textTheme.titleLarge),
              Text(
                'TOPLAM TUTAR',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Navigate.payment.route);
            },
            child: Text(
              'Alışverişi Tamamla',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
