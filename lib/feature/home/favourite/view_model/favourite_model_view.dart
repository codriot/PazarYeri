import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/products/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

class FavouriteModelView extends GetxController {
  RxList<SearchedProductItem>? favorites = <SearchedProductItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchcart();
  }

  void goDetail(dynamic argument) {
    Get.toNamed(Navigate.productDetail.route, arguments: argument);
  }

  Future<void> fetchcart() async {
    try {
      final response =
          await NetworkManager().getRequest(ServicePath.favourite.path);
      if (response.statusCode == 200) {
        final cartItems = response.data!['favorites'] as List<dynamic>;
        favorites?.value = cartItems
            .map(
              (item) => SearchedProductItem.fromJson(
                item['details'] as Map<String, dynamic>,
              ),
            )
            .toList();
        Logger().i('Favori items: $favorites');
      }
    } catch (e) {
      Logger().e('Favori itemleri çekilemedi: $e');
    }
  }
}
