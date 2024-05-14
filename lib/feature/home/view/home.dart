import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final sliderImagePaths = ["assets/images/BlackFridayPhoto.png", null, null];
  final gridImagePaths = [
    "assets/images/Flame.png",
    "assets/images/yildiz.png",
    "assets/images/sanaozel.png",
    "assets/images/kategori.png"
  ];

  late List<Widget> _pages;
  int ActivePage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = List.generate(
      sliderImagePaths.length,
      (index) => ImagePickHolder(imagepath: sliderImagePaths[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: ListView(
          children: [
            const CustomSearchBar(hintText: "marka ürün veya kategori ara..."),
            _PhotoSlider(),
            _buildRow(),
            _buildRow(),
            _infOneriText(),
            _influencers(),
            _bigDiscount(context),
            _popularTextRow(context),
            _GridViewProduct(),
          ],
        ),
      ),
    );
  }

  GridView _GridViewProduct() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.3,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            // Tıklama işlemi buraya eklenebilir
          },
          child: const _CustomProductContainer(),
        );
      }),
    );
  }

  Row _popularTextRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Popüler Olanlar,",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
            onPressed: () {},
            child: const Text("Hepsini Gör",
                style: TextStyle(color: ColorsProject.apricotSorbet))),
      ],
    );
  }

  Padding _infOneriText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Influencer Önerileri",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }

  Container _bigDiscount(BuildContext context) {
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
              "Büyük İndirimler",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Image.asset("assets/images/indirim.png"),
          ],
        ),
      ),
    );
  }

  SizedBox _influencers() {
    return SizedBox(
      height: Get.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/SılaCerkez.png",
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
                const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Sıla Çerkez",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _buildRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_elevatedButtonIcon(), _elevatedButtonIcon()],
      ),
    );
  }

  ElevatedButton _elevatedButtonIcon() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset(
        "assets/images/Flame.png",
        width: 30,
        height: 30,
      ),
      label: const Text("Sana Özel"),
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

  Stack _PhotoSlider() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: SizedBox(
            height: Get.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    ActivePage = value;
                  });
                },
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return _pages[index];
                }),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 23,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: List<Widget>.generate(
                      _pages.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: ActivePage == index
                                    ? Colors.white
                                    : Colors.white24,
                              ),
                            ),
                          )),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _CustomProductContainer extends StatelessWidget {
  const _CustomProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/Urun1.png", // Resim dosyasının adı
                    fit: BoxFit.cover,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Resme tıklama işlemi buraya eklenebilir
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "XXX Erkek Vücut Parfümü", // Açıklama metni
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "\$99", // Fiyat metni
                style: TextStyle(
                  color: Color(0xFFF2A663), // Fiyat rengi
                  fontWeight: FontWeight.bold, // Kalın font
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImagePickHolder extends StatelessWidget {
  const ImagePickHolder({super.key, this.imagepath});
  final String? imagepath;
  @override
  Widget build(BuildContext context) {
    return imagepath != null
        ? SizedBox(
            child: Image.asset(
              imagepath!,
              fit: BoxFit.cover,
            ),
          )
        : Container(
            color: Colors.grey,
            child: SizedBox(
              child: Center(
                  child: Text(
                "YAKINDA...",
                style: Theme.of(context).textTheme.displaySmall,
              )),
            ));
  }
}
