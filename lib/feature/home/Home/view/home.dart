import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/home/Home/view/util/home_util.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar_general.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeUtil {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(colorsAppBar: Colors.transparent),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
        child: ListView(
          children: [
            const GeneralSearchBar(
              hintText: 'marka ürün veya kategori ara...',
            ),
            PhotoSlider(),
            buildRow(),
            influencers(),
            bigDiscount(context),
            popularTextRow(context),
            Obx(() {
              if (controller.isLoading.value) {
                return gridViewProductError();
              } else if (controller.products != null) {
                return gridViewProduct();
              } else {
                return const Center(child: Text('Ürün Bulunamadı'));
              }
            }),
          ],
        ),
      ),
    );
  }
}
