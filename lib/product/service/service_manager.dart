// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';
import 'package:turkiye_yazilim_staj/product/init/config/app_environment.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/storage/storage_util.dart';

/// This class is responsible for network operations
class NetworkManager extends DioMixin {
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
          // 'API_KEY': _apiKey,
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

  Cart,
  credit_card,
  discount,
  influencer,
  favorite,
  wallet,
  address,
  pastOrders,
  purchase,
  comments;

  String get path {
    switch (this) {
      case ServicePath.User:
        return '/users';
      case ServicePath.product:
        return '/products';
      case ServicePath.product_search:
        return '/search_products?term=';
      case ServicePath.credit_card:
        return '/credit_card/${StorageUtil().getUserId()}';
      case ServicePath.discount:
        return '/discount';
      case ServicePath.influencer:
        return '/influencers';
      case ServicePath.favorite:
        return '/favorites/${StorageUtil().getUserId()}';
      case ServicePath.wallet:
        return '/wallet/${StorageUtil().getUserId()}';
      case ServicePath.address:
        return '/address/${StorageUtil().getUserId()}';
      case ServicePath.Cart:
        return '/cart/${StorageUtil().getUserId()}';
      case ServicePath.pastOrders:
        return '/past_orders/${StorageUtil().getUserId()}';
      case ServicePath.comments:
        return '/comments';
      case ServicePath.purchase:
        return '/purchase/${StorageUtil().getUserId()}';
    }
  }
}
