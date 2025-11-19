import 'package:http/http.dart' as http;
import 'dart:convert';

///This is service class which will bring data to the app
class ApiService {
  final String baseUrl;
  final http.Client client;

  ApiService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    final response = await client.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print("inside correct response $data");
      return data;
    } else {
      print("Inside exception ${response.statusCode} with ${response.request?.url}");
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}