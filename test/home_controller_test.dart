import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turkiye_yazilim_staj/feature/home/view_model/home_view_model.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';

// Mock NetworkManager class
class MockNetworkManager extends Mock implements NetworkManager {}

void main() {
  late HomeController controller;
  late MockNetworkManager mockNetworkManager;

  setUp(() {
    mockNetworkManager = MockNetworkManager();
    controller = HomeController()..networkManager = mockNetworkManager;
  });

  group('HomeController Test', () {
    test('fetchInfluencers test', () async {
      // Mock API response
      final mockResponse = Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: [
          {
            'image':
                'https://cdn.glitch.global/2a677113-2079-4646-b555-4ce710ee7b93/MertDemir.png?v=1715950213192',
            'name': 'Mert DEMİR',
          },
          {
            'image':
                'https://cdn.glitch.global/2a677113-2079-4646-b555-4ce710ee7b93/SenaGök.png?v=1715951032433',
            'name': 'Sena GÖK',
          }
        ],
      );

      when(mockNetworkManager.getRequest(ServicePath.influencer.path))
          .thenAnswer(
        (_) async => Future.value(
          mockResponse as Future<Response<Map<String, dynamic>>>?,
        ),
      );

      await controller.fetchInfluencers();

      expect(controller.influencerItems.length, 2);
      expect(controller.influencerItems[0].name, 'Mert DEMİR');
      expect(controller.influencerItems[1].name, 'Sena GÖK');
    });

    test('fetchInfluencers fails test', () async {
      // Mock API failure response
      when(mockNetworkManager.getRequest(ServicePath.influencer.path))
          .thenThrow(Exception('Failed to load influencers'));

      await controller.fetchInfluencers();

      expect(controller.influencerItems.isEmpty, true);
    });
  });
}
