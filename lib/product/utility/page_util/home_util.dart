import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/Home/controller/home_controller.dart';
import 'package:turkiye_yazilim_staj/feature/Home/model/home_model.dart';
import 'package:turkiye_yazilim_staj/feature/Home/view/home.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';

mixin HomeUtility on State<HomeView> {
  final controller = Get.put(HomeController());
  late final List<Widget> pages = List.generate(
    controller.sliderImagePaths.length,
    (index) => ImagePickHolder(
      imagepath: controller.sliderImagePaths[index],
    ),
  );

  GridView buildProductLoadingGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(4, (index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
        );
      }),
    );
  }

  GridView buildProductGridView() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.85,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(
              Navigate.productDetail.route,
              arguments: controller.products?[index],
            );
          },
          child: CustomProductContainer(
            image: controller.products?[index].image,
            name: controller.products?[index].name,
            price: controller.products?[index].price,
          ),
        );
      }),
    );
  }

  Row popularTextRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popüler Olanlar,',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Hepsini Gör',
            style: TextStyle(color: ColorsProject.apricotSorbet),
          ),
        ),
      ],
    );
  }

  Container bigDiscount(BuildContext context) {
    return Container(
      height: Get.height * 0.27,
      decoration: BoxDecoration(
        color: ColorsProject.apricotSorbet,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Büyük İndirimler',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Container(
                  height: Get.height * 0.17,
                  width: Get.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                );
              }
              return Image.network(
                controller.bigDiscountImage!.value,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<InfluencerItem>> buildInfluencersListView() {
    return FutureBuilder<List<InfluencerItem>>(
      future: controller.fetchInfluencers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Veri yüklenirken loading ekranı göster
          return SizedBox(
            height: Get.height * 0.135,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 70,
                          color: Colors.grey.shade200,
                          width: 100,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.lerp(
                              BorderRadius.circular(8),
                              BorderRadius.circular(8),
                              8,
                            ),
                          ),
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          // Hata varsa hata mesajı göster
          return Text('Veriler yüklenirken bir hata oluştu: ${snapshot.error}');
        } else {
          // Veriler yüklendiğinde ListView'i oluştur
          final influencerItems = snapshot.data ?? [];
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Influencer Önerileri',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Navigate.influencer.route);
                },
                child: SizedBox(
                  height: Get.height * 0.135,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: influencerItems.length,
                    itemBuilder: (context, index) {
                      final influencer = influencerItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                influencer.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              right: 0,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Text(
                                influencer.name!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Padding buildSpecialCategoryGrid(BuildContext context) {
    final items = controller.createItems();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: Get.height * 0.14,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
            mainAxisSpacing: context.height * 0.02,
            crossAxisSpacing: context.width * 0.02,
          ),
          itemBuilder: (context, index) {
            return _buildSpecialElevatedButton(
              imagePath: items[index].imagePath,
              text: items[index].text,
            );
          },
        ),
      ),
    );
  }

  ElevatedButton _buildSpecialElevatedButton({
    required String text,
    required String imagePath,
  }) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black54,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.white70),
        elevation: 1,
        minimumSize: const Size(180, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 30,
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(text),
          ),
        ],
      ),
    );
  }

  Stack buildDiscountNewsSlider() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: SizedBox(
            height: Get.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Container(
                    color: Colors.grey.shade200,
                  );
                }
                return PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (value) {
                    controller.activePage.value = value;
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                );
              }),
            ),
          ),
        ),
        Obx(
          () => Positioned(
            left: 0,
            right: 0,
            bottom: 23,
            child: ColoredBox(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: List<Widget>.generate(
                      controller.sliderImagePaths.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: InkWell(
                          onTap: () {
                            controller.pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor:
                                controller.activePage.value == index
                                    ? Colors.white
                                    : Colors.white24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomProductContainer extends StatelessWidget {
  const CustomProductContainer({
    this.image,
    this.name,
    this.price,
    super.key,
  });
  final String? image;
  final String? name;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 450,
              width: 200,
              child: Image.network(
                image ?? 'https://picsum.photos/200/300',
                // Ürün resmi
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name ?? 'bağlantı sorunu', // Ürün adı
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 10),
        Text(
          '$price₺', // Ürün fiyatı
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color(0xFFF2A663), // Fiyat rengi
              ),
        ),
      ],
    );
  }
}

class ImagePickHolder extends StatelessWidget {
  const ImagePickHolder({super.key, this.imagepath});
  final String? imagepath;
  @override
  Widget build(BuildContext context) {
    return imagepath != ''
        ? SizedBox(
            child: Image.network(
              imagepath!,
              fit: BoxFit.cover,
            ),
          )
        : ColoredBox(
            color: Colors.grey,
            child: SizedBox(
              child: Center(
                child: Text(
                  'YAKINDA...',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          );
  }
}
