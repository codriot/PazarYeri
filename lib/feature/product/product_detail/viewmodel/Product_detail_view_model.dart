import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/model/cart_model.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/model/comment_model.dart';
import 'package:turkiye_yazilim_staj/feature/product/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

class ProductDetailViewModel extends GetxController {
  // Ürün bilgilerini tutan observable değişken
  Rx<ProductItem?> product = Rx<ProductItem?>(null);
  RxList<CommentModel>? comments = <CommentModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchComment();
    final product = Get.arguments as ProductItem;
    setProduct(product);
  }

  // Ürün adedi için observable değişken
  RxInt count = 1.obs;

  // Gelen ürünü set eden metod
  void setProduct(ProductItem newProduct) {
    product.value = newProduct;
  }

  // Ürün adedini artıran metod
  void incrementCount() {
    count.value++;
  }

  // Ürün adedini azaltan metod
  void decrementCount() {
    if (count.value > 1) {
      count.value--;
    }
  }

  Future<void> _fetchComment() async {
    try {
      final response =
          await NetworkManager().getRequest(ServicePath.comments.path);
      if (response.statusCode == 200) {
        final commentJson = response.data!['comment'] as List<dynamic>;
        Logger().i('Yorumlar json: $commentJson');
        comments?.value = commentJson
            .map(
              (item) => CommentModel.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
        Logger().i('Yorumlar: $commentJson');
      }
    } catch (e) {
      Logger().e('Yorumlar alınamadı: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addFavorite(int productId) async {
    isLoading.value = true;
    Logger().i('Ürün başarıyla eklendi: $productId');
    try {
      final response = await NetworkManager().postRequest(
        ServicePath.Cart.path,
        data: {'product_id': productId},
      );
      Logger().i('Ürün başarıyla eklendi: ${response.data}');
    } catch (e) {
      Logger().e('Kredi kartı eklenemedi: $e');
    } finally {
      Get.snackbar(
        'Ürün başarıyla favorilere eklendi',
        '',
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> addCard(CartModel newProduct) async {
    isLoading.value = true;
    Logger().i('Ürün başarıyla eklendi: ${newProduct.toJson()}');
    try {
      final response = await NetworkManager().postRequest(
        ServicePath.Cart.path,
        data: newProduct.toJson(),
      );
      Logger().i('Ürün başarıyla eklendi: ${response.data}');
    } catch (e) {
      Logger().e('Kredi kartı eklenemedi: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
