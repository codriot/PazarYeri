import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/Home/model/home_model.dart';
import 'package:turkiye_yazilim_staj/product/model/product_model.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/image/assets.gen.dart';

/// Home controller for the home page
class HomeController extends GetxController {
  RxList<String> sliderImagePaths = <String>[].obs;
  RxString? bigDiscountImage = ''.obs;
  RxList<InfluencerItem>? influencerItems = <InfluencerItem>[].obs;
  RxList<ProductModel>? products = <ProductModel>[].obs;
  RxBool isLoading = true.obs;

  /// List of influencer items
  RxInt activePage = 0.obs;
  List<ButtonItem> createItems() {
    return [
      ButtonItem(
        text: 'Çok Satanlar',
        imagePath: Assets.images.cokSatanlar.path,
      ),
      ButtonItem(
        text: 'Fırsat ürünleri',
        imagePath: Assets.images.fRsatUrunleri.path,
      ),
      ButtonItem(text: 'Sana Özel', imagePath: Assets.images.sanaOzel.path),
      ButtonItem(
        text: 'Kategoriler',
        imagePath: Assets.images.kategoriler.path,
      ),
    ];
  }

  final NetworkManager networkManager = NetworkManager();
  final PageController pageController = PageController();
  // late final NetworkManager networkManager; // Test için lazımdı
  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  /// Fetches initial data from the API
  Future<void> fetchInitialData() async {
    try {
      await Future.wait([
        fetchDiscount(),
        fetchInfluencers(),
        fetchProducts(),
      ]);
    } catch (e) {
      print('Initial data fetch failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetches influencers from the API
  Future<List<InfluencerItem>> fetchInfluencers() async {
    try {
      final response =
          await networkManager.getRequest(ServicePath.influencer.path);

      if (response.statusCode == 200) {
        Logger().i('Influencer response: ${response.data}');

        final data = response.data!;
        final influencers = data['influencers'] as List<dynamic>;

        influencerItems?.value = influencers
            .map(
              (item) => InfluencerItem.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        return influencerItems! as List<InfluencerItem>;

        // Logger().i('Influencer items loaded successfully: $influencerItems');
      } else {
        Logger().e('Failed to load influencer data: ${response.statusCode}');
        throw Exception(
          'Failed to load influencer data: ${response.statusCode}',
        );
      }
    } catch (e) {
      Logger().e('Influencer verileri yüklenemedi: $e');
      throw Exception('Influencer verileri yüklenemedi: $e');
    }
  }

  /// Fetches discount images from the API
  Future<void> fetchDiscount() async {
    try {
      final response =
          await networkManager.getRequest(ServicePath.discount.path);
      if (response.statusCode == 200) {
        final data = response.data!;
        final discountImages = data['discount'] as List<dynamic>;
        final bigDiscountImages = data['bigDiscount'] as List<dynamic>;

        sliderImagePaths.value =
            discountImages.map((item) => item['img'] as String).toList();
        bigDiscountImage?.value = bigDiscountImages[0]['img'] as String;
        Logger().i('Slider images loaded successfully: $sliderImagePaths');
        Logger().i(
          'Big discount image loaded successfully: ${bigDiscountImage?.value}',
        );
      }
    } catch (e) {
      Logger().e('Failed to load slider images: $e');
    }
  }

  /// Fetches products from the API
  Future<void> fetchProducts() async {
    try {
      final response =
          await networkManager.getRequest(ServicePath.product.path);

      if (response.statusCode == 200) {
        final responseData = response.data!;
        final data = responseData['products'] as List<dynamic>;
        products?.value = data
            .map(
              (item) => ProductModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        Logger().i('Products loaded successfully: $products');
      }
    } catch (e) {
      Logger().e('Failed to load products: $e');
    }
  }
}
