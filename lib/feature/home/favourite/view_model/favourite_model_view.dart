import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/model/cart_model.dart';
import 'package:turkiye_yazilim_staj/feature/product/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

class FavouriteModelView extends GetxController {
  RxList<ProductItem>? favorites = <ProductItem>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchfavorite();
  }

  void goDetail(dynamic argument) {
    Get.toNamed(Navigate.productDetail.route, arguments: argument);
  }

  Future<void> fetchfavorite() async {
    try {
      final response =
          await NetworkManager().getRequest(ServicePath.favorite.path);
      if (response.statusCode == 200) {
        final cartItems = response.data!['favorites'] as List<dynamic>;
        favorites?.value = cartItems
            .map(
              (item) => ProductItem.fromJson(
                item['details'] as Map<String, dynamic>,
              ),
            )
            .toList();
        Logger().i('Favori items: $favorites');
      }
    } catch (e) {
      Logger().e('Favori itemleri çekilemedi: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// adding new product from favorites to cart
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
