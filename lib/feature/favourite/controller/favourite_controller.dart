import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/model/add_cart_model.dart';
import 'package:turkiye_yazilim_staj/product/model/product_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

/// FavouriteController is a GetxController class that manages the favorite items.
class FavoriteController extends GetxController {
  RxList<ProductModel>? favorites = <ProductModel>[].obs;
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
              (item) => ProductModel.fromJson(
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
  Future<void> addCard(AddCartModel newProduct) async {
    isLoading.value = true;
    Logger().i('Ürün başarıyla eklendi: ${newProduct.toJson()}');
    try {
      final response = await NetworkManager().postRequest(
        ServicePath.Cart.path,
        data: newProduct.toJson(),
      );
      Logger().i('Ürün başarıyla eklendi: ${response.data}');
    } catch (e) {
      Logger().e('Ürün eklenemedi: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
