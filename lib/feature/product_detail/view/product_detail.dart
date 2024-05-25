import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/product_detail/viewmodel/Product_detail_view_model.dart';
import 'package:turkiye_yazilim_staj/feature/product_detail/viewmodel/comment_model_view.dart';
import 'package:turkiye_yazilim_staj/feature/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/comment_ui.dart';

part 'product_detail_widgets.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView>
    with ProductDetailUtil {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 1200,
            width: context.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Ürün fotoğrafı
                productPhoto(context),
                // Altta sheet şeklinde gelen bir yazı
                Positioned(
                  top: 420,
                  left: 0,
                  right: 0,
                  child: _firstReview(
                    hata,
                    context,
                  ),
                ),
                // Fiyat ve sepete ekle
                Positioned(
                  top: 640,
                  left: 0,
                  right: 0,
                  child: _cardAndComment(context, hata),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
