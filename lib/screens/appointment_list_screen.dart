import 'dart:convert';
import 'package:book_app_api/api_service.dart';
import 'package:flutter/material.dart';
import '../models/appointment_model.dart';
import 'appointment_details_screen.dart';

class AppointmentListScreen extends StatelessWidget {
  const AppointmentListScreen({super.key});

  Future<List<AppointmentModel>> fetchAppointments() async {
    final response = await ApiClient.get('customer/appointment');
    final data = jsonDecode(response.body)['appointments']['data'] as List;
    return data.map((e) => AppointmentModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appointments')),
      body: FutureBuilder<List<AppointmentModel>>(
        future: fetchAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Error loading appointments'));
          }
          final list = snapshot.data!;
          if (list.isEmpty) return const Center(child: Text('No appointments found'));
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) {
              final ap = list[i];
              return ListTile(
                title: Text(ap.name),
                subtitle: Text('Date: ${ap.bookingDate} | Status: ${ap.orderStatus}'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AppointmentDetailsScreen(appointmentId: ap.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
