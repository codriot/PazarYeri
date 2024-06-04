import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/product/model/product_model.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

/// Cart view model for the cart page
class CartController extends GetxController {
  RxList<ProductModel>? productsList = <ProductModel>[].obs;
  RxBool isLoading = true.obs;

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
      final response = await NetworkManager().getRequest(ServicePath.Cart.path);
      if (response.statusCode == 200) {
        final cartItems = response.data!['cart'] as List<dynamic>;
        productsList?.value = cartItems
            .map(
              (item) => ProductModel.fromJson(
                item['details'] as Map<String, dynamic>,
              ),
            )
            .toList();
        Logger().i('Cart items: $productsList');
      }
    } catch (e) {
      Logger().e('Cart itemleri çekilemedi: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
