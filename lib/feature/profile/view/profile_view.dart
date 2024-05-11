import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/profile/modelview/profile_model_view.dart';
import 'package:turkiye_yazilim_staj/product/const/colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var profiles = ProfileViewModel().profiles;

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: Get.height * 0.8,
          width: Get.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(23)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: [
                _profileReview(context),
                Expanded(
                  child: ListView.builder(
                    itemCount: ProfileViewModel().profiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _sectionButton(context,
                          title: profiles[index].name,
                          icon: profiles[index].icon,
                          route: profiles[index].route);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Column _sectionButton(BuildContext context,
      {required String title, required IconData icon, String? route}) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          title: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: ColorsProject.apricot_sorbet)),
          leading: Icon(
            icon,
            color: ColorsProject.apricot_sorbet,
          ),
          //todo: basınca yönlendirme yapılacak
          // onTap: () => Get.toNamed(),
        ),
      ],
    );
  }

  Padding _profileReview(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text('Emre Armağan',
            style: Theme.of(context).textTheme.titleLarge!),
        subtitle: Text('PREMIUM',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: ColorsProject.apricot_sorbet)),
        leading: const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profilepp.png'),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}