import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/profile/cards/controller/card_controller.dart';
import 'package:turkiye_yazilim_staj/feature/profile/cards/model/card_model.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/image/assets.gen.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/mixin/card_utils.dart';
import 'package:turkiye_yazilim_staj/product/widget/add_new_outlined_button.dart';
import 'package:turkiye_yazilim_staj/product/widget/general_app_bar.dart';

part 'part/add_new_card_view.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CardController());
    return Scaffold(
      appBar: const GeneralAppBar(colorsAppBar: Colors.white),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Get.height * 0.03,
          horizontal: Get.width * 0.03,
        ),
        child: Column(
          children: [
            AddNewInfo(
              onPressed: () {
                _showCustomBottomSheet(context);
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

  Future<dynamic> _showCustomBottomSheet(BuildContext context) {
    return showModalBottomSheet<dynamic>(
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
              Expanded(child: AddNewCardView()),
            ],
          ),
        );
      },
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
    final maskedCardNumber = cardNumber.replaceRange(0, 16, '****-****-****-');

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
                    maskedCardNumber,
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
