import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:turkiye_yazilim_staj/apps/utility/page_util/home_util.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/image/assets.gen.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/general_app_bar.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/search_bar_general.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeUtility {
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
          child: ListView(
            children: [
              const GeneralAppBar(colorsAppBar: Colors.transparent),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: GeneralSearchBar(
                  hintText: 'marka ürün veya kategori ara...',
                ),
              ),
              buildDiscountNewsSlider(),
              buildSpecialCategoryGrid(context),
              buildInfluencersListView(),
              bigDiscount(context),
              popularTextRow(context),
              Obx(() {
                if (controller.isLoading.value) {
                  return buildProductLoadingGrid();
                } else if (controller.products != null) {
                  return buildProductGridView();
                } else {
                  return const Center(child: Text('Ürün Bulunamadı'));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
