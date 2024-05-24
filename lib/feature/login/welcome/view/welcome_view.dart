import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/login/welcome/viewmodel/welcome_view_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';
import 'package:turkiye_yazilim_staj/product/widget/next_page_button.dart';

class FirstLoginView extends StatelessWidget {
  const FirstLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final PrivacyPolicyController statecontroller =
        Get.put(PrivacyPolicyController());

    final TextEditingController controller = TextEditingController(text: '+90');
    return Scaffold(
      appBar: const CustomAppBar(isWhite: true, isTransparent: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hoşgeldin,\nAramıza katil ve doyasıya alışveriş \nyap !',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            PhoneNumber(controller: controller),
            Text(
              "Sana doğrulama kodu içeren bir SMS göndereceğiz. Kimseyle paylasmayiniz.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: const Color(0xffC5C4C3)),
            ),
            const PrivacyPolicyWidget(),
            Obx(
              () => NextButton(
                canGo: statecontroller.isChecked.value == true,
                page: Navigate.auth.route,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            height: 50,
            width: 50,
          ),
          TextField(
            keyboardType: TextInputType.phone,
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Telefon Numaranızı Giriniz',
              prefixIcon: Image(image: AssetImage('assets/images/turkey.png')),
            ),
          ),
        ]),
      ),
    );
  }
}

class PrivacyPolicyWidget extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(
      init: PrivacyPolicyController(),
      builder: (controller) {
        return CheckboxListTile(
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          checkColor: ColorsProject.apricotSorbet,
          contentPadding: EdgeInsets.zero,
          title: InkWell(
            onTap: () {},
            child: Text(
              "Gizlilik Politikası ve şartlarinizi kabul ediyorum.",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorsProject.apricotSorbet,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          side: const BorderSide(color: ColorsProject.apricotSorbet, width: 1),
          value: controller.isChecked.value,
          activeColor: Colors.white,
          onChanged: controller.toggleCheckbox,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}
