import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DenemeController extends GetxController {
  // discount verilerini bir listede tutma
  RxList<String> discountUrls = <String>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      // Dio client oluşturma
      final dio = Dio();

      // Başlık oluşturma
      // final headers = <String, dynamic>{
      //   'API_KEY': 'Ug8D7q0i',
      // };

      // GET isteği oluşturma
      final response = await dio.get(
        'https://fire-different-yuzu.glitch.me/discount',
        // options: Options(headers: headers),
      );

      // İsteğin başarılı olup olmadığını kontrol etme
      if (response.statusCode == 200) {
        Logger().d(response.data);

        final data = response.data as Map<String, dynamic>;

        // discount ve bigDiscount verilerini alın
        final discountImages = data['discount'] as List<dynamic>;

        for (final discount in discountImages) {
          discountUrls.add(discount['img'] as String);
        }

        // Verileri işleme devam edin...
      } else {
        Logger().d(response.data);

        // İstekte hata oluştuğunda işleme devam edin...
      }
    } catch (e) {
      // Hata oluştuğunda işleme devam edin...
    }
  }
}
