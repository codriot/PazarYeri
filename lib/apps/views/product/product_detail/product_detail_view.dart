import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/cart_controller.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/favourite_controller.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/navigation_bar_controller.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/product/product_detail_controller.dart';
import 'package:turkiye_yazilim_staj/apps/models/add_cart_model.dart';
import 'package:turkiye_yazilim_staj/apps/models/product_model.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/add_to_cart_dialog.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/comment_ui.dart';

part 'part/product_detail_widgets.dart';

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
            height: Get.height * 1.63,
            width: Get.width,
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
                  top: 670,
                  left: 0,
                  right: 0,
                  child:
                      _cardAndComment(context, hata, controller.product.value!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
