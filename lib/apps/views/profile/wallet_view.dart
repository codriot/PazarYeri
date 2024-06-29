import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/profile/wallet_controller.dart';
import 'package:turkiye_yazilim_staj/apps/models/product_model.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/image/assets.gen.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/mixin/custom_gradient.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/general_app_bar.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletController());
    return Scaffold(
      appBar: const GeneralAppBar(
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
              child: _buildWalletContainer(context, controller),
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
                      product: controller.pastOrders![index],
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

  Container _buildWalletContainer(
    BuildContext context,
    WalletController controller,
  ) {
    return Container(
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
    );
  }

  Padding _recentTransactions(
    BuildContext context, {
    required ProductModel product,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Navigate.productDetail.route, arguments: product);
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            gradient: CustomGradient.walletRecentGradient(),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(1, 1),
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
                    product.image ?? '',
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
                    product.name ?? 'Product Name',
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
                        '-${product.price}₺',
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
        ),
      ),
    );
  }
}
