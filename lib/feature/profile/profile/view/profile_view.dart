import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/profile/profile/viewmodel/profile_model_view.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/util/mixin/custom_gradient.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profiles = ProfileViewModel().profiles;

    return Container(
      decoration: BoxDecoration(
        gradient: CustomGradient.linearGradient(),
      ),
      child: Center(
        child: Container(
          height: Get.height * 0.8,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                _profileReview(context),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ProfileViewModel().profiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _sectionButton(
                        context,
                        title: profiles[index].name,
                        icon: profiles[index].icon,
                        route: profiles[index].route,
                        canBack:
                            profiles[index].route != Navigate.welcome.route,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _sectionButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String? route,
    required bool canBack,
  }) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: ColorsProject.apricotSorbet),
          ),
          leading: Icon(
            icon,
            color: ColorsProject.apricotSorbet,
          ),
          //todo: basınca yönlendirme yapılacak
          onTap: () => canBack
              ? Get.toNamed(route!)
              : Get.defaultDialog(
                  title: 'Onay',
                  middleText: 'Yönlendirme yapmak istediğinize emin misiniz?',
                  textConfirm: 'Evet',
                  textCancel: 'Hayır',
                  confirmTextColor: Colors.white,
                  onConfirm: () => Get.offAndToNamed(route!),
                  onCancel: () {},
                ),
        ),
      ],
    );
  }

  Padding _profileReview(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          'Emre Armağan',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          'PREMIUM',
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: ColorsProject.apricotSorbet),
        ),
        leading: const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profilepp.png'),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
