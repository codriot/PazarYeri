import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

class AdressView extends StatelessWidget {
  const AdressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.03, horizontal: Get.width * 0.03),
        child: Column(
          children: [
            AddNewInfo(
              onPressed: () {},
              title: "Yeni Adres Ekle",
              icon: Icons.add_location_outlined,
            ),
            const Spacer(),
            Expanded(
              flex: 22,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  //todo: adreslerin listelenmesi widget oluşturulacak
                  return ListTile(
                    title: const Text("Adres"),
                    subtitle: const Text("Adres Detayı"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddNewInfo extends StatelessWidget {
  const AddNewInfo({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          side: const BorderSide(
            color: ColorsProject.apricotSorbet,
            width: 2,
          ),
          elevation: 10,
        ),
        onPressed: onPressed,
        child: ListTile(
          title: Center(child: Text(title)),
          leading: Icon(icon),
        ));
  }
}
