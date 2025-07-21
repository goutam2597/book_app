import 'package:http/http.dart' as http;

class ApiClient {
  static String baseUrl = 'https://masud.kreativdev.com/bookapp/api/';
  static String? token;

  static Map<String, String> getHeaders() {
    final headers = <String, String>{};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  static Future<http.Response> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final Map<String, String> stringData = data.map(
      (key, value) => MapEntry(key.toString(), value.toString()),
    );
    final headers = getHeaders();
    // Explicitly set content-type if you want JSON (optional, for form-urlencoded you can skip this)
    // headers['Content-Type'] = 'application/x-www-form-urlencoded';
    return await http.post(url, body: stringData, headers: headers);
  }

  static Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = getHeaders();
    return await http.get(url, headers: headers);
  }
}
