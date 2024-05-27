import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/past_orders/model_view/past_orders_view_model.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/util/mixin/custom_gradient.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar_general.dart';

class PastOrdersView extends StatefulWidget {
  const PastOrdersView({super.key});

  @override
  State<PastOrdersView> createState() => _PastOrdersViewState();
}

class _PastOrdersViewState extends State<PastOrdersView> {
  final controller = Get.put(PastOrdersViewModel());

  @override
  void dispose() {
    Get.delete<PastOrdersViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(colorsAppBar: Colors.white),
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
                          return _PastOrdersCard(
                            productName: controller.pastOrders![index].name,
                            productPrice: controller.pastOrders![index].price,
                            productPhoto: controller.pastOrders![index].image,
                            sellerName: controller.pastOrders![index].dealer,
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

class _PastOrdersCard extends StatelessWidget {
  const _PastOrdersCard({
    super.key,
    this.productPhoto,
    this.productName,
    this.productPrice,
    this.sellerName,
  });
  final String? productPhoto;
  final String? productName;
  final double? productPrice;
  final String? sellerName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          color: Colors.grey.shade100,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: ColorsProject.titanium,
              width: 2,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              // Ürüne tıklandığında yapılacak işlemler
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              productPhoto ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName ?? '',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$productPrice₺',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorsProject.apricotSorbet,
                                  ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                const Spacer(
                                  flex: 7,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    gradient:
                                        CustomGradient.detailButtonGradient(),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      'Detaylar',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: ColorsProject.titanium, width: 2),
              top: BorderSide(color: ColorsProject.titanium, width: 0.5),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Satıcı: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade700,
                          ),
                    ),
                    TextSpan(
                      text: sellerName ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  children: [
                    const WidgetSpan(
                      child: Icon(Icons.check, color: Colors.green),
                    ),
                    TextSpan(
                      text: ' Teslim edildi',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.green,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
