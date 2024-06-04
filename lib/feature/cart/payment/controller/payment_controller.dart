import 'package:get/get.dart';
import 'package:logger/web.dart';
import 'package:turkiye_yazilim_staj/feature/cart/cart/controller/cart_controller.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

class PaymentController extends GetxController {
  RxBool isLoading = true.obs;
  final cartController = Get.find<CartController>();

  @override
  void onInit() {
    super.onInit();
    payment();
  }

  Future<void> payment() async {
    await purchase();
    await cartController.fetchcart();
  }

  Future<void> purchase() async {
    try {
      final response =
          await NetworkManager().postRequest(ServicePath.purchase.path);
      Logger().i('Satın alma işlemi başarılı: ${response.data}');
    } catch (e) {
      Logger().e('Satın alma işlemi başarısız: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
