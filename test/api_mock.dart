
import 'package:circleciguvi/base/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart' hide MockClient;
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
import 'api_mock.mocks.dart';

void main() {
  group('ApiService', () {
    final client = MockClient();
    final apiService = ApiService(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        client: client
    );

    test('returns data if the http call completes successfully', () async {
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async => http.Response('{"userId": 1, "id": 21, "title": "Test", "body": "Test body"}', 200));


      expect(await apiService.fetchData('posts/1'), isA<Map<String, dynamic>>());
      //expect(await apiService.fetchData('posts/1'), throwsException);
    });

    test('throws an exception if the http call completes with an error', () {
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/100')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiService.fetchData('posts/1'), throwsException);
    });
  });
}