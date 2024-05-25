import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/home/favourite/view_model/favourite_model_view.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar_general.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteModelView());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            const GeneralSearchBar(
              hintText: 'favorilerde ara...',
            ),
            const Spacer(),
            Expanded(
              flex: 25,
              child: ListView.builder(
                itemCount: controller.favorites?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.goDetail(controller.favorites?[index]);
                    },
                    child: UrunKarti(
                      urunAdi: controller.favorites?[index].name ?? '',
                      fiyat: controller.favorites?[index].price ?? 0.0,
                      marka: controller.favorites?[index].dealer ?? '',
                      gorselUrl: controller.favorites?[index].image ?? '',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UrunKarti extends StatelessWidget {
  const UrunKarti({
    required this.urunAdi,
    required this.marka,
    required this.fiyat,
    required this.gorselUrl,
    super.key,
  });

  final String urunAdi;
  final String marka;
  final double fiyat;
  final String gorselUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.grey.shade100,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
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
                      gorselUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          urunAdi,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Text(
                      '${fiyat.toStringAsFixed(2)}₺',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsProject.apricotSorbet,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Kargo Bedava',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Hızlı teslimat',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                ),
                onPressed: () {},
                child: const Text(
                  'Sepete Ekle',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
