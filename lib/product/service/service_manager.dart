// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';
import 'package:turkiye_yazilim_staj/product/init/config/app_environment.dart';
import 'package:turkiye_yazilim_staj/product/util/storage/storage_util.dart';

/// This class is responsible for network operations
class NetworkManager {
  // Factory constructor to return the same instance
  factory NetworkManager() {
    return _instance;
  }

  // Private constructor for singleton pattern
  NetworkManager._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          'API_KEY': _apiKey,
          'Content-Type': 'application/json',
        },
      ),
    );
  }
  // Singleton instance
  static final NetworkManager _instance = NetworkManager._internal();

  late Dio _dio;
  final String _baseUrl = AppEnvironment.baseUrl;
  final String _apiKey = AppEnvironment.apiKey;

  /// Get request method
  Future<Response<Map<String, dynamic>>> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        // Dio'dan gelen hata yanıtı varsa
        throw Exception(
          'Failed to GET data: ${e.response!.statusCode} - ${e.response!.statusMessage}',
        );
      } else {
        // Dio'dan gelen hata yanıtı yoksa
        throw Exception('Failed to GET data: ${e.message}');
      }
    }
  }

  /// Post request method
  Future<Response> postRequest(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.post<Map<String, dynamic>>(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(
        'Failed to POST data: ${e.response?.statusCode} - ${e.message}',
      );
    }
  }
}

/// Path enum for service paths
enum ServicePath {
  User,
  product,
  product_search,
  postCart,
  getCart,
  credit_card,
  discount,
  influencer,
  favourite,
  wallet,
  adress;

  String get path {
    switch (this) {
      case ServicePath.User:
        //  şeklinde kullanıcı id'si ile cart bilgilerine ulaşılabilir
        return '/users';
      case ServicePath.product:
        return '/products';
      case ServicePath.product_search:
        return '/search_products?term=';
      case ServicePath.postCart:
        return '/cart';
      //{     "user_id": 1,     "product_id": 1,     "amount": 2 } bu şekilde post edilecek
      case ServicePath.credit_card:
        return '/credit_card';
      //{     "user_id": 1,     "card_number": "1234-5678-9012-3456",     "expiry_date": "12/25",     "card_holder_name": "Ali Veli",     "cvv": "123" } bu şekilde post edilecek
      case ServicePath.discount:
        return '/discount';
      case ServicePath.influencer:
        return '/influencers';
      case ServicePath.favourite:
        return '/favorites/${StorageUtil().getUserId()}';
      case ServicePath.wallet:
        return '/wallet';
      case ServicePath.adress:
        return '/adress';
      case ServicePath.getCart:
        return '/cart/${StorageUtil().getUserId()}';
    }
  }
}
