part of '../search_result_view.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({required this.product, super.key});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product detail page
        Get.toNamed(Navigate.productDetail.route, arguments: product);
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
              const SizedBox(height: 10),
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
