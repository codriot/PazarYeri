import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/home/Home/view/home.dart';
import 'package:turkiye_yazilim_staj/feature/home/Home/view_model/home_view_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

mixin HomeUtil on State<HomeView> {
  final controller = Get.put(HomeController());
  late final List<Widget> pages = List.generate(
    controller.sliderImagePaths.length,
    (index) => ImagePickHolder(
      imagepath: controller.sliderImagePaths[index],
    ),
  );

  GridView gridViewProductError() {
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

  GridView gridViewProduct() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
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

  Column influencers() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Influencer Önerileri',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        Obx(() {
          return GestureDetector(
            onTap: () {
              Get.toNamed(Navigate.influencer.route);
            },
            child: SizedBox(
              height: Get.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.influencerItems?.length ?? 6,
                itemBuilder: (context, index) {
                  final influencer = controller.influencerItems?[index];
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            influencer?.image ?? '',
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
                            influencer?.name ?? '',
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
          );
        }),
      ],
    );
  }

  Padding buildRow() {
    final items = controller.createItems();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _elevatedButtonIcon(
                imagePath: items[0].imagePath,
                text: items[0].text,
              ),
              _elevatedButtonIcon(
                imagePath: items[1].imagePath,
                text: items[1].text,
              ),
            ],
          ),
          const SizedBox(height: 10), // Boşluk bırak (10 birim
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _elevatedButtonIcon(
                imagePath: items[2].imagePath,
                text: items[2].text,
              ),
              _elevatedButtonIcon(
                imagePath: items[3].imagePath,
                text: items[3].text,
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton _elevatedButtonIcon({
    required String text,
    required String imagePath,
  }) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset(
        imagePath,
        width: 30,
        height: 30,
      ),
      label: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(text),
      ),
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
    );
  }

  Stack PhotoSlider() {
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
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$price₺', // Ürün fiyatı
          style: const TextStyle(
            color: Color(0xFFF2A663), // Fiyat rengi
            fontWeight: FontWeight.bold, // Kalın font
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
