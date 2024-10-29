import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.example.com';

  Future<http.Response> fetchData(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.get(url);
  }
}
