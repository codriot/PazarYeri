part of '../past_orders_view.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    required this.productModel,
    super.key,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          color: Colors.grey.shade100,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: ColorsProject.titanium,
              width: 2,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(
                Navigate.productDetail.route,
                arguments: productModel,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              productModel.image ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel.name ?? '',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${productModel.price}₺',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorsProject.apricotSorbet,
                                  ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                const Spacer(
                                  flex: 7,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    gradient:
                                        CustomGradient.detailButtonGradient(),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      'Detaylar',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: ColorsProject.titanium, width: 2),
              top: BorderSide(color: ColorsProject.titanium, width: 0.5),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Satıcı: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade700,
                          ),
                    ),
                    TextSpan(
                      text: productModel.dealer ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  children: [
                    const WidgetSpan(
                      child: Icon(Icons.check, color: Colors.green, size: 20),
                    ),
                    TextSpan(
                      text: ' Teslim edildi',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.green,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
