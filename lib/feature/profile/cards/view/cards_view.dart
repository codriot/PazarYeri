import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/profile/address/adress_view.dart';
import 'package:turkiye_yazilim_staj/feature/profile/cards/view/widget/add_new_card_view.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.03, horizontal: Get.width * 0.03),
        child: Column(
          children: [
            AddNewInfo(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return Container(
                        height: Get.height * 0.7,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
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
                        ));
                  },
                );
              },
              title: "Yeni Kart Ekle",
              icon: Icons.add,
            ),
            const Spacer(),
            Expanded(
              flex: 22,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  //todo: kartların listeleneceği widget oluşturulacak
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

  // Future<dynamic> _addCardBottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //       context: context,
  //       builder: (context) => Form(
  //               child: Column(
  //             children: [
  //               TextFormField(
  //                 decoration: const InputDecoration(
  //                   labelText: "Kart Numarası",
  //                 ),
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(
  //                   labelText: "Son Kullanma Tarihi",
  //                 ),
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(
  //                   labelText: "CVC",
  //                 ),
  //               ),
  //               ElevatedButton(
  //                   onPressed: () {}, child: const Text("Kartı Ekle"))
  //             ],
  //           )));
  // }
}
