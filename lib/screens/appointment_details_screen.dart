import 'package:book_app_api/api_service.dart';
import 'package:flutter/material.dart';
import '../models/appointment_details_model.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final int appointmentId;
  const AppointmentDetailsScreen({super.key, required this.appointmentId});

  Future<AppointmentDetailsModel> _fetchDetails() => ApiService.getAppointmentDetails(appointmentId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appointment Details')),
      body: FutureBuilder<AppointmentDetailsModel>(
        future: _fetchDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Error loading details'));
          }
          final ap = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ap.serviceName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Order ID: ${ap.orderNumber}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                const SizedBox(height: 8),
                Text('Booking Date: ${ap.bookingDate}'),
                Text('Time: ${ap.startDate} - ${ap.endDate}'),
                const SizedBox(height: 8),
                Text('Status: ${ap.orderStatus}'),
                Text('Payment: ${ap.paymentStatus} (${ap.customerPaid})'),
                const SizedBox(height: 12),
                Text('Customer:', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('${ap.customerName} (${ap.customerEmail}, ${ap.customerPhone})'),
                const SizedBox(height: 12),
                Text('Vendor:', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('${ap.vendorName} (${ap.vendorEmail}, ${ap.vendorPhone})'),
                const SizedBox(height: 12),
                Text('Staff: ${ap.staffName}'),
                const SizedBox(height: 12),
                Text('Address: ${ap.serviceAddress}'),
                const SizedBox(height: 12),
                Text('Description:', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(ap.serviceDescription.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '')),
              ],
            ),
          );
        },
      ),
    );
  }
}
