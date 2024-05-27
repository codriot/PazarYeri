import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/product/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

/// Past Orders View Model Logic Class
class PastOrdersViewModel extends GetxController {
  RxList<ProductItem>? pastOrders = <ProductItem>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchpastOrders();
  }

  Future<void> _fetchpastOrders() async {
    try {
      final response =
          await NetworkManager().getRequest(ServicePath.pastOrders.path);
      if (response.statusCode == 200) {
        final cartItems = response.data!['pastOrders'] as List<dynamic>;
        Logger().i('Cart items: $cartItems');
        pastOrders?.value = cartItems
            .map(
              (item) => ProductItem.fromJson(
                item['details'] as Map<String, dynamic>,
              ),
            )
            .toList();
      }
    } catch (e) {
      Logger().e('Cart itemleri çekilemedi: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
