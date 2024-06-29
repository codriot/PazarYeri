import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/apps/models/profile/card_model.dart';
import 'package:turkiye_yazilim_staj/apps/services/service_manager.dart';

/// Card view model
class CardController extends GetxController {
  final isLoading = true.obs;
  RxList<CreditCardModel>? creditCards = <CreditCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchCreditCards();
  }

  /// Fetch credit cards method
  Future<void> _fetchCreditCards() async {
    try {
      final response =
          await NetworkManager().getRequest(ServicePath.credit_card.path);
      if (response.statusCode == 200) {
        final creditCardsJson = response.data!['credit_card'] as List<dynamic>;
        creditCards?.value = creditCardsJson
            .map(
              (item) => CreditCardModel.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
        Logger().i('Kredi kartları: $creditCards');
      }
    } catch (e) {
      Logger().e('Kredi kartları alınamadı: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Add new credit card method
  Future<void> addCreditCard(CreditCardModel newCard) async {
    isLoading.value = true;
    try {
      final response = await NetworkManager().postRequest(
        ServicePath.credit_card.path,
        data: newCard.toJson(),
      );
      if (response.statusCode == 200) {
        // Yeni kart başarıyla eklendiğinde kartları tekrar yükleyin
        await _fetchCreditCards();
        Logger().i('Kredi kartı başarıyla eklendi: ${response.data}');
      }
    } catch (e) {
      Logger().e('Kredi kartı eklenemedi: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
