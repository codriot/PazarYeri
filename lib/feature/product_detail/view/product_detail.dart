import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/product_detail/viewmodel/Product_detail_view_model.dart';
import 'package:turkiye_yazilim_staj/feature/product_detail/viewmodel/comment_model_view.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/comment_ui.dart';

part 'product_detail_widgets.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    int count = 0;
    var hata = "Hata  oluştu";
    // getx ile state yönetimi yapılacak
    void incrementCount() {
      setState(() {
        count++;
      });
    }

    void decrementCount() {
      setState(() {
        if (count > 0) {
          count--;
        }
      });
    }
    // düzenleme yapılacak

    return Scaffold(
      body: ListView(
        children: [
          // Ürün fotoğrafı
          productPhoto(context),
          // Altta sheet şeklinde gelen bir yazı
          _firstReview(hata, context, decrementCount, count, incrementCount),
          // Fiyat ve sepete ekle
          _cardAndComment(context, hata)
        ],
      ),
    );
  }

  Container _cardAndComment(BuildContext context, String hata) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      //todo:  düzenleme yapılacak
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _priceAndAddCart(context),
            SellerReview(hata: hata, context: context),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 18),
              child: Text(
                'Ürün Değerlendirmeleri',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: Get.height * 0.5,
              decoration: BoxDecoration(
                color: ColorsProject.grey.withOpacity(0.06),
                borderRadius: BorderRadius.circular(21),
                border: Border.all(
                    color: ColorsProject.grey.withOpacity(0.3), width: 1.5),
              ),
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CommentSection(
                        comment: CommentModelView().comments[index],
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: ColorsProject.apricotSorbet,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(21),
                            bottomRight: Radius.circular(21),
                          ),
                        ),
                      ),
                      child: const Text("TÜMÜNÜ GÖR"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _firstReview(
      String hata,
      BuildContext context,
      void Function() decrementCount,
      int count,
      void Function() incrementCount) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ürün adı
          Text(ProductDetailViewModel().profileViewModel.name ?? hata,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                  )),
          // Ürün açıklaması
          Text(
            ProductDetailViewModel().profileViewModel.description ?? hata,
            style: TextStyle(
              fontSize: 16,
              //todo bir tık daha gri

              color: ColorsProject.grey.withOpacity(0.7),
            ),
          ),
          //değerlendirme
          const StarAndComment(),

          // Açıklama
          Text(
            ProductDetailViewModel().profileViewModel.description2 ?? hata,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12,
                ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: CustomDivider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('ADET'),
              _counterWidget(decrementCount, count, incrementCount),
            ],
          )

          // Butonlar
        ],
      ),
    );
  }

  Row _priceAndAddCart(BuildContext context) {
    return Row(
      children: [
        // Favorilere ekle
        Flexible(
          fit: FlexFit.tight,
          child: ListTile(
            title: Text(
                "${ProductDetailViewModel().profileViewModel.price!.toStringAsFixed(2)} ₺",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                    )),
            subtitle: Text(
              "Toplam Tutar",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ),
        ),
        // Sepete ekle
        SizedBox(
          width: 150,
          //! sağ köşede sıkışmış fix
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const _AddedToCartDialog();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
              child: Text(
                'SEPETE EKLE',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.white,
                  shadows: [
                    const BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Container _counterWidget(void Function() decrementCount, int count,
      void Function() incrementCount) {
    return Container(
      width: 100,
      height: 32,
      decoration: BoxDecoration(
        color: ColorsProject.grey.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _counterButton(decrementCount, Icons.remove),
          Text('$count'),
          _counterButton(incrementCount, Icons.add),
        ],
      ),
    );
  }
  // todo: outlined ile nasıl olur bence güzel olur

  SizedBox _counterButton(void Function() onPressed, IconData icon) {
    return SizedBox(
      height: 30,
      width: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Icon(
            icon,
            size: 10,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Todo  sağ alta resim kaydırma eklentisi yapılacak
  Stack productPhoto(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Fotoğraf
        Image.asset(
          ProductDetailViewModel()
              .profileViewModel
              .imagePath, //todo: eğer foto gelmezse gri olsun

          fit: BoxFit.cover,
        ),
        // Geri tuşu
        Positioned(
          top: 40.0,
          left: 15.0,
          child: MinimalButton(
            icon: Icons.arrow_back,
            onPressed: () => Get.back(),
          ),
        ),
        Positioned(
          top: 40.0,
          right: 15.0,
          child: MinimalButton(
            icon: Icons.favorite,
            onPressed: () => Get.back(),
          ),
        ),
      ],
    );
  }
}
