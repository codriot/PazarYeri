import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/address/model/address_model.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/address/view_model/address_view_model.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/add_new_outlined_button.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

class AdressView extends StatefulWidget {
  const AdressView({super.key});

  @override
  State<AdressView> createState() => _AdressViewState();
}

class _AdressViewState extends State<AdressView> {
  final controller = Get.put(AddressViewModel());

  @override
  void dispose() {
    super.dispose();
    Get.delete<AddressViewModel>();
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
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            const Divider(
                              thickness: 3,
                              endIndent: 150,
                              indent: 150,
                              color: ColorsProject.apricotSorbet,
                            ),
                            SizedBox(height: Get.height * 0.02),
                            const Text('Yeni Adres Ekle'),
                            const SizedBox(height: 10),
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'Adres Başlığı',
                              ),
                            ),
                            const SizedBox(height: 10),
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'Adres',
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                controller.addAdressInfo(
                                  AddressModel(
                                    address: 'Adres',
                                    addressName: 'Adres Başlığı',
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Kaydet',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              title: _newAddressTitle,
              icon: Icons.add_location_outlined,
            ),
            const Spacer(),
            Expanded(
              flex: 27,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: controller.address?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return _adressCard(
                      context,
                      address: controller.address![index].address,
                      title: controller.address![index].addressName,
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

  String get _newAddressTitle => 'Yeni Adres Ekle';

  Card _adressCard(BuildContext context, {String? address, String? title}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 50,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on_sharp,
                  color: ColorsProject.apricotSorbet,
                ),
                const SizedBox(width: 10),
                Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.border_color_sharp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              address ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
