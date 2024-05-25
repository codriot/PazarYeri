import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/products/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar_general.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the productList argument passed from the previous page
    final productList =
        (Get.arguments as List<SearchedProductItem>).map((e) => e).toList();

    if (productList.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Ürün bulunamadı.',
          ),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const GeneralSearchBar(
              hintText: 'Marka Ürün veya Kategori ara…',
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
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
                return ResultItem(
                  product: productList[index],
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  const ResultItem({required this.product, super.key});
  final SearchedProductItem product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product detail page
        Get.toNamed(Navigate.productDetail.route, arguments: product);

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
                        product.image ?? '',
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
                    product.name ?? '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${product.price}₺',
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
