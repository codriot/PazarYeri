import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/profile/address/model/address_model.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

class AddressController extends GetxController {
  final isLoading = true.obs;
  RxList<AddressModel>? address = <AddressModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchAddress();
  }

  Future<void> _fetchAddress() async {
    try {
      final response =
          await NetworkManager().getRequest(ServicePath.address.path);
      if (response.statusCode == 200) {
        final addressJson = response.data!['address'] as List<dynamic>;
        Logger().i('adresler: $addressJson');
        address?.value = addressJson
            .map(
              (item) => AddressModel.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
        Logger().i('adres içeriği: $address');
      }
    } catch (e) {
      Logger().e('Kredi kartları alınamadı: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Add new address method
  Future<void> addAdressInfo(AddressModel address) async {
    isLoading.value = true;
    try {
      final response = await NetworkManager().postRequest(
        ServicePath.address.path,
        data: address.toJson(),
      );
      if (response.statusCode == 200) {
        // Yeni kart başarıyla eklendiğinde kartları tekrar yükleyin
        await _fetchAddress();
        Logger().i('adres başarıyla eklendi: ${response.data}');
      }
    } catch (e) {
      Logger().e('adres eklenemedi hata : $e');
    } finally {
      isLoading.value = false;
    }
  }
}
