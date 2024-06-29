import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/navigation_bar_controller.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/profile/profile_controller.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/image/assets.gen.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/storage/storage_util.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profiles = ProfileController().profiles;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.profile.path),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: Get.height * 0.12),
          child: Center(
            child: Container(
              height: Get.height * 0.8,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    _profileReview(context),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ProfileController().profiles.length,
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
    final navBarController = Get.find<NavBarController>();
    return Column(
      children: [
        const Divider(),
        ListTile(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: ColorsProject.coffeClay),
          ),
          leading: Icon(
            icon,
            color: ColorsProject.coffeClay,
          ),
          onTap: () => canBack
              ? Get.toNamed(route!, id: 1)
              // ? Navigator.pushNamed(context, route!)
              // ? Navigator.pushNamed(context, route!)
              : Get.defaultDialog(
                  title: 'Onay',
                  middleText: 'Yönlendirme yapmak istediğinize emin misiniz?',
                  textConfirm: 'Evet',
                  textCancel: 'Hayır',
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    navBarController.changeTabIndex(0);
                    Get.offAndToNamed(route!);
                    StorageUtil().removeUserId();
                  },
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
              .copyWith(color: ColorsProject.coffeClay),
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
