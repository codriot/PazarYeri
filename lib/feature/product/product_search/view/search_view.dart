import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_search/controller/search_controller.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_search_result/view/search_result_view.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/image/assets.gen.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_app_bar.dart';

part 'parts/search_bar.dart';
part 'parts/searched_words_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = Get.put(SearchProductController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(Assets.images.searchBackground.path),
          fit: BoxFit.cover,
          height: Get.height,
          width: Get.width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView(
              children: [
                const CustomAppBarBuilder(),
                const CustomSearchBar(),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.02),
                  child:
                      OldSearchedWordsList(searchController: searchController),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
