import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/core/gen/assets.gen.dart';
import 'package:turkiye_yazilim_staj/feature/product/search/view/search_bar.dart';
import 'package:turkiye_yazilim_staj/feature/product/search/view_model/search_view_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = Get.put(SearchViewModel());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(Assets.images.backgroundImage.path),
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
                const CustomSearchBar(),
                SizedBox(height: Get.height * 0.02),
                Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.5,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: searchController.aramaGecmisi.length,
                      itemBuilder: (context, index) {
                        final arama = searchController.aramaGecmisi[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    searchController.removeSearch(arama);
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    size: 27,
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.04),
                                Text(arama),
                              ],
                            ),
                            const Divider(
                              endIndent: 10,
                              indent: 10,
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
