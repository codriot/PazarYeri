import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

// getx kullan sayfa yenilemesi istenirse sonra oto güncellersin
/// Cart view model for the cart page
class CartViewModel extends GetxController {
  RxList<SearchedProductItem>? productsList = <SearchedProductItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchcart();
  }

  Future<void> fetchcart() async {
    try {
      final response =
          await NetworkManager().getRequest(ServicePath.getCart.path);
      if (response.statusCode == 200) {
        final cartItems = response.data!['cart'] as List<dynamic>;
        productsList?.value = cartItems
            .map(
              (item) => SearchedProductItem.fromJson(
                item['details'] as Map<String, dynamic>,
              ),
            )
            .toList();
        Logger().i('Cart items: $productsList');
      }
    } catch (e) {
      Logger().e('Cart itemleri çekilemedi: $e');
    }
  }
}
