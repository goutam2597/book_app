import 'package:book_app_api/api_service.dart';
import 'package:flutter/material.dart';
import '../models/dashboard_model.dart';
import 'appointment_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Future<DashboardModel> _fetchDashboard() => ApiService.getDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: FutureBuilder<DashboardModel>(
        future: _fetchDashboard(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Error loading dashboard'));
          }
          final dashboard = snapshot.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              // User Info section
              CircleAvatar(
                radius: 36,
                backgroundImage:
                    dashboard.userPhoto != null &&
                        dashboard.userPhoto!.isNotEmpty
                    ? NetworkImage(dashboard.userPhoto!)
                    : const AssetImage('assets/images/userplaceholder.png')
                          as ImageProvider,
                child:
                    (dashboard.userPhoto == null ||
                        dashboard.userPhoto!.isEmpty)
                    ? const Icon(Icons.person, size: 40)
                    : null,
              ),
              const SizedBox(height: 8),
              Text(
                dashboard.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                dashboard.userEmail,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              // Counts section
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
