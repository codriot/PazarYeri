import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/navigation_bar_controller.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/product/search_result_controller.dart';
import 'package:turkiye_yazilim_staj/apps/models/product_model.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/custom_app_bar.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/custom_bottom_navigation_bar.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/search_bar_general.dart';

part 'parts/result_item_widget.dart';
part 'parts/result_product_grid_view.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchResultController());
    final navBarController = Get.find<NavBarController>();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: navBarController.tabIndex.value,
        onTap: (int value) {
          Get.back();
          navBarController.changeTabIndex(value);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const CustomAppBarBuilder(),
            const GeneralSearchBar(
              hintText: 'Marka Ürün veya Kategori ara…',
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _filterButtons(context),
            ),

            // Display the search results
            Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : buildProductGridView(controller: controller),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Row _filterButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _iconAndTextButton(
          context,
          Icons.swap_vert_outlined,
          'Sırala',
        ),
        _iconAndTextButton(
          context,
          Icons.filter_list_outlined,
          'Filtrele',
        ),
      ],
    );
  }

  ElevatedButton _iconAndTextButton(
    BuildContext context,
    IconData icon,
    String text,
  ) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade50,
        elevation: 2,
      ),
      onPressed: () {},
      icon: Icon(
        icon,
        color: ColorsProject.apricotSorbet,
      ),
      label: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          right: 30,
          left: 25,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
