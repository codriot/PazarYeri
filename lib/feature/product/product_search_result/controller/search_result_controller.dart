import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/product/model/product_model.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

class SearchResultController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  final isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSearchResult(Get.arguments as String);
  }

  Future<void> getSearchResult(String text) async {
    try {
      final response = await NetworkManager()
          .getRequest(ServicePath.product_search.path + text);
      Logger().i('Arama sonuçları: ${response.data}');

      // `products` anahtarına sahip veriyi al
      final productListData = response.data!['products'] as List<dynamic>;

      // Veriyi `SearchedProductModel` modellerine dönüştür
      productList = RxList<ProductModel>(
        productListData.map((productJson) {
          return ProductModel.fromJson(
            productJson as Map<String, dynamic>,
          );
        }).toList(),
      );

      // Yeni sayfaya yönlendirme ve productList'i argüman olarak gönderme
    } catch (e) {
      // Hata işleme
      Logger().e('Arama sorgusu işlenirken hata oluştu: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
