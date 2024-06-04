import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/login/welcome/controller/welcome_controller.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/image/assets.gen.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_app_bar.dart';

part 'parts/next_page_button.dart';
part 'parts/phone_number_widget.dart';
part 'parts/privacy_policy_widget.dart';

class FirstLoginView extends StatelessWidget {
  const FirstLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final statecontroller = Get.put(PrivacyPolicyController());

    final controller = TextEditingController(text: '+90');
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.backgroundImage.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarBuilder(
                hasNotificationButton: false,
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  'Hoşgeldin,\nAramıza katil ve doyasıya alışveriş \nyap !',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Spacer(),
              Text(
                'TELEFON NUMARANIZI GIRINIZ',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: ColorsProject.grey.withOpacity(0.6),
                    ),
              ),
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
                  child: NextPageButton(
                    canGo: statecontroller.isChecked.value == true,
                    page: Navigate.auth.route,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
