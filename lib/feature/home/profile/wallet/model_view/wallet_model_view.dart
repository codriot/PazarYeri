import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/wallet/model/wallet_model.dart';
import 'package:turkiye_yazilim_staj/feature/product/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

class WalletModelView extends GetxController {
  final wallet = 0.obs;
  final isLoading = true.obs;
  RxList<ProductItem>? pastOrders = <ProductItem>[].obs;
  final amount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    _fetchWallet();
    _fetchpastOrders();
    isLoading.value = false;
  }

  @override
  NetworkManager networkManager = NetworkManager();

  Future<void> _fetchWallet() async {
    try {
      final response = await networkManager.getRequest(
        ServicePath.wallet.path,
      );
      final walletData = WalletModel.fromJson(response.data!);
      wallet.value = walletData.wallet ?? 0;
      Logger().i('Wallet fetched successfully: ${walletData.wallet}');
    } catch (e) {
      print('Failed to fetch wallet: $e');
      Logger().e('Failed to fetch wallet: $e');
    }
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
        final amounts = cartItems.map((item) => item['amount'] as int).toList();

        // Calculate the total amount
        final totalAmount = amounts.fold(0, (acc, curr) => acc + curr);

        amount.value = totalAmount;
      }
    } catch (e) {
      Logger().e('Cart itemleri çekilemedi: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
