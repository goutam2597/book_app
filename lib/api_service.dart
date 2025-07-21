import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dashboard_model.dart';
import '../models/appointment_model.dart';
import '../models/appointment_details_model.dart';

class ApiService {
  static String baseUrl = 'https://masud.kreativdev.com/bookapp/api/';
  static String? _token;

  static String? get token => _token;

  static set token(String? value) {
    _token = value;
  }

  static Map<String, String> getHeaders() {
    final headers = <String, String>{};
    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    return headers;
  }

  // Login with username and password
  static Future<String?> login(String username, String password) async {
    final url = Uri.parse('${baseUrl}customer/login/submit');
    final res = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );
    final data = jsonDecode(res.body);
    if (data['status'] == 'success' && data['token'] != null) {
      _token = data['token'];
      return null; // success
    } else {
      return data['message'] ?? 'Login failed';
    }
  }

  static Future<DashboardModel> getDashboard() async {
    final url = Uri.parse('${baseUrl}customer/dashboard');
    final res = await http.get(url, headers: getHeaders());
    final data = jsonDecode(res.body)['data'];
    return DashboardModel.fromJson(data);
  }

  static Future<List<AppointmentModel>> getAppointments() async {
    final url = Uri.parse('${baseUrl}customer/appointment');
    final res = await http.get(url, headers: getHeaders());
    final list = jsonDecode(res.body)['appointments']['data'] as List;
    return list.map((e) => AppointmentModel.fromJson(e)).toList();
  }

  static Future<AppointmentDetailsModel> getAppointmentDetails(int id) async {
    final url = Uri.parse('${baseUrl}customer/appointment/details/$id');
    final res = await http.get(url, headers: getHeaders());
    return AppointmentDetailsModel.fromJson(jsonDecode(res.body));
  }
}
