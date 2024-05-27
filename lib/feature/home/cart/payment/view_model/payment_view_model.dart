import 'package:get/get.dart';
import 'package:logger/web.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

class PaymentViewModel extends GetxController {
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    Get.snackbar(
      'Sepetiniz Onaylanmıştır',
      'Ödeme işlemi başlatılıyor',
      duration: const Duration(seconds: 5),
    );
    purchase();
    Get.snackbar(
      'Ödeme işlemi Tamamlandı(Ciddiye almayın sadece yazı)',
      '(5 sn içinde otomatik yönlendirileceksiniz)',
      duration: const Duration(seconds: 5),
    );
    Future.delayed(const Duration(seconds: 5), () {
      Get.back<void>();
    });
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
