import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/core/gen/assets.gen.dart';
import 'package:turkiye_yazilim_staj/feature/login/welcome/viewmodel/welcome_view_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

class FirstLoginView extends StatelessWidget {
  const FirstLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final statecontroller = Get.put(PrivacyPolicyController());

    final controller = TextEditingController(text: '+90');
    return Scaffold(
      appBar: const CustomAppBar(
        colorsAppBar: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Expanded(
              child: Text(
                'Hoşgeldin,\nAramıza katil ve doyasıya alışveriş \nyap !',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            PhoneNumber(controller: controller),
            Text(
              'Sana doğrulama kodu içeren bir SMS göndereceğiz. Kimseyle paylasmayiniz.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: const Color(0xffC5C4C3)),
            ),
            const PrivacyPolicyWidget(),
            Obx(
              () => Expanded(
                flex: 4,
                child: NextButton(
                  canGo: statecontroller.isChecked.value == true,
                  page: Navigate.auth.route,
                ),
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
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
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
              decoration: InputDecoration(
                hintText: 'Telefon Numaranızı Giriniz',
                prefixIcon: Image(image: AssetImage(Assets.images.turkey.path)),
              ),
            ),
          ],
        ),
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
              'Gizlilik Politikası ve şartlarinizi kabul ediyorum.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorsProject.apricotSorbet,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          side: const BorderSide(color: ColorsProject.apricotSorbet),
          value: controller.isChecked.value,
          activeColor: Colors.white,
          onChanged: controller.toggleCheckbox,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({required this.page, super.key, this.canGo = false});
  final bool canGo;
  final String page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            if (canGo) {
              Get.offAndToNamed(page);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
            child: Text(
              'Kodu Gönder',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
