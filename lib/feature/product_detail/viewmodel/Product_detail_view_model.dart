import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/search/model/searched_product_model.dart';

class ProductDetailViewModel extends GetxController {
  // Ürün bilgilerini tutan observable değişken
  Rx<SearchedProductItem?> product = Rx<SearchedProductItem?>(null);

  // Ürün adedi için observable değişken
  RxInt count = 1.obs;

  // Gelen ürünü set eden metod
  void setProduct(SearchedProductItem newProduct) {
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
}
