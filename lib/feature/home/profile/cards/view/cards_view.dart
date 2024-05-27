import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/core/gen/assets.gen.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/cards/view/add_new_card_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/cards/viewModel/card_view_model.dart';
import 'package:turkiye_yazilim_staj/product/util/mixin/card_utils.dart';
import 'package:turkiye_yazilim_staj/product/widget/add_new_outlined_button.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  final controller = Get.put(CardViewModel());
  @override
  void dispose() {
    Get.delete<CardViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(colorsAppBar: Colors.white),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Get.height * 0.03,
          horizontal: Get.width * 0.03,
        ),
        child: Column(
          children: [
            AddNewInfo(
              onPressed: () {
                showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: Get.height * 0.7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Divider(
                              thickness: 3,
                              color: Colors.black,
                              indent: 100,
                              endIndent: 100,
                            ),
                          ),
                          Expanded(child: AddNewCardScreen()),
                        ],
                      ),
                    );
                  },
                );
              },
              title: 'Yeni Kart Ekle',
              icon: Icons.add,
            ),
            const Spacer(),
            Expanded(
              flex: 22,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: controller.creditCards!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _creditCardInfoCard(
                      context,
                      cardNumber:
                          controller.creditCards![index].cardNumber ?? '',
                      cardOwner:
                          controller.creditCards![index].cardHolderName ?? '',
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

  Widget _cardPhoto(String cardNumber) {
    switch (CardUtils.getCardTypeFrmNumber(cardNumber)) {
      case CardType.Master:
        return Image.asset(
          Assets.images.mastercard.path,
          width: 80,
          height: 48,
          fit: BoxFit.cover,
        );
      case CardType.Visa:
        return Image.asset(
          Assets.images.visa.path,
          width: 80,
          height: 48,
          fit: BoxFit.cover,
        );
      case CardType.Verve:
        return Image.asset(
          Assets.images.verve.path,
          width: 80,
          height: 48,
          fit: BoxFit.cover,
        );
      case CardType.AmericanExpress:
        return Image.asset(
          Assets.images.americanExpress.path,
          width: 80,
          height: 48,
          fit: BoxFit.cover,
        );
      case CardType.Others:
        return const Icon(
          Icons.credit_card,
          size: 24,
          color: Color(0xFFB8B5C3),
        );
      default:
        return const Icon(Icons.warning, size: 24, color: Color(0xFFB8B5C3));
    }
  }

  Card _creditCardInfoCard(
    BuildContext context, {
    required String cardNumber,
    required String cardOwner,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 15,
          bottom: 15,
          right: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _cardPhoto(cardNumber),
                  const SizedBox(height: 10),
                  Text(
                    cardOwner,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    cardNumber,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.border_color_sharp,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
