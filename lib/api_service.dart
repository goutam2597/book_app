import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://018ef2b7efba.ngrok-free.app/api";

  Future<Map<String, dynamic>> fetchServices() async {
    final response = await http.get(Uri.parse("$baseUrl/services"));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    }
    throw Exception("Failed to load services");
  }

  Future<Map<String, dynamic>> fetchServiceDetails(int serviceId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/services/details?id=$serviceId"),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    }
    throw Exception("Failed to load service details");
  }
}
