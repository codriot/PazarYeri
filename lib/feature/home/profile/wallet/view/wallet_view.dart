import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/core/gen/assets.gen.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/wallet/model_view/wallet_model_view.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/util/mixin/custom_gradient.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  final controller = Get.put(WalletModelView());

  @override
  void dispose() {
    Get.delete<WalletModelView>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        colorsAppBar: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 14,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsProject.titanium.withOpacity(0.5),
                  border: Border.all(color: ColorsProject.titanium, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.wallet.path),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200,
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Toplam Bakiye     \n',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: controller.isLoading.value
                                  ? ''
                                  : '${controller.wallet.value}₺',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Hareketlerim',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Text(
              'Recent Transactions',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Expanded(
              flex: 34,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: controller.pastOrders!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _recentTransactions(
                      context,
                      price: (controller.amount.value *
                              controller.pastOrders![index].price!)
                          .toInt(),
                      name: controller.pastOrders![index].name,
                      imagePath: controller.pastOrders![index].image,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Container _recentTransactions(
    BuildContext context, {
    int? price,
    String? name,
    String? imagePath,
  }) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        gradient: CustomGradient.walletRecentGradient(),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imagePath ?? '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                name ?? 'Product Name',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    '-$price₺',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorsProject.apricotSorbet,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
