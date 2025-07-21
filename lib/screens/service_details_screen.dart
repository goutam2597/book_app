// import 'package:book_app_api/api_service.dart';
// import 'package:flutter/material.dart';
//
// class ServiceDetailsScreen extends StatefulWidget {
//   final int serviceId;
//   const ServiceDetailsScreen({super.key, required this.serviceId});
//
//   @override
//   State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
// }
//
// class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
//   late Future<Map<String, dynamic>> futureData;
//   final ApiService apiService = ApiService();
//
//   @override
//   void initState() {
//     super.initState();
//     futureData = apiService.fetchServiceDetails(widget.serviceId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Service Details')),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: futureData,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           final details = snapshot.data!['details'];
//           final content = details['content'] as List;
//           final sliderImages = details['slider_image'] as List;
//           final vendor = details['vendor_info'];
//           final related = snapshot.data!['related_services'] as List;
//
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Image Carousel
//                   SizedBox(
//                     height: 200,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: sliderImages.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           margin: const EdgeInsets.only(right: 8),
//                           child: Image.network(
//                             sliderImages[index]['image'],
//                             height: 200,
//                             width: 300,
//                             fit: BoxFit.cover,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     details['name'] ?? '',
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     details['price'] + ' ৳',
//                     style: const TextStyle(fontSize: 18, color: Colors.green),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     details['address'] ?? '',
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 12),
//                   // Description
//                   ...content.map(
//                     (c) => Padding(
//                       padding: const EdgeInsets.only(bottom: 12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             c['name'] ?? '',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             c['description']?.replaceAll(
//                                   RegExp(r'<[^>]*>'),
//                                   '',
//                                 ) ??
//                                 '',
//                             style: const TextStyle(fontSize: 15),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Divider(height: 32),
//                   // Vendor Info
//                   Text(
//                     'Vendor: ${vendor['name'] ?? ''}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text('Address: ${vendor['address'] ?? ''}'),
//                   const Divider(height: 32),
//                   // Related Services
//                   const Text(
//                     'Related Services:',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                   ...related.map(
//                     (r) => ListTile(
//                       leading: Image.network(
//                         r['service_image'],
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       ),
//                       title: Text(r['name']),
//                       subtitle: Text(r['price'] + ' ৳'),
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 ServiceDetailsScreen(serviceId: r['id']),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
