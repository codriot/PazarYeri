import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar_general.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the productList argument passed from the previous page
    final productList = (Get.arguments as List<dynamic>)
        .map((e) => e as SearchedProductItem)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const GeneralSearchBar(
              hintText: 'Marka Ürün veya Kategori ara…',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade50,
                    elevation: 2,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.swap_vert_outlined,
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
                      'Sırala',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.grey.shade50,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list_outlined,
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
                      'Filtrele',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Display the search results
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                childAspectRatio: 0.60, // 4:3 aspect ratio
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ResultItem(
                  imagePath: product.image ?? '',
                  name: product.name ?? '',
                  price: product.price.toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  const ResultItem({super.key, this.imagePath, this.name, this.price});
  final String? imagePath;
  final String? name;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product detail page
        // Get.to(ProductDetailPage.new, arguments: product);
      },
      child: Card(
        elevation: 4,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Display the product image
              Expanded(
                flex: 8,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imagePath ?? '',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                    const Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name ?? '',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$price₺',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorsProject.apricotSorbet,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Kargo Bedava',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
