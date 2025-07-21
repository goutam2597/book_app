import 'dart:convert';
import 'package:book_app_api/api_service.dart';
import 'package:flutter/material.dart';
import '../models/dashboard_model.dart';
import 'appointment_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Future<DashboardModel> fetchDashboard() async {
    final response = await ApiClient.get('customer/dashboard');
    final data = jsonDecode(response.body)['data'];
    return DashboardModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: FutureBuilder<DashboardModel>(
        future: fetchDashboard(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Error loading dashboard'));
          }
          final dashboard = snapshot.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wishlists: ${dashboard.wishlistsCount}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Appointments: ${dashboard.appointmentsCount}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Orders: ${dashboard.ordersCount}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AppointmentListScreen(),
                    ),
                  );
                },
                child: const Text('View Appointments'),
              ),
            ],
          );
        },
      ),
    );
  }
}
