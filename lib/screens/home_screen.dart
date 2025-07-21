// import 'package:book_app_api/api_service.dart';
// import 'package:book_app_api/screens/service_details_screen.dart';
// import 'package:flutter/material.dart';
// import '../models/category_model.dart';
// import '../models/service_model.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late Future<Map<String, dynamic>> futureData;
//   final ApiService apiService = ApiService();
//
//   @override
//   void initState() {
//     super.initState();
//     futureData = apiService.fetchServices();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('BookApp Services')),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: futureData,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           final categories = (snapshot.data!['categories'] as List)
//               .map((e) => CategoryModel.fromJson(e))
//               .toList();
//           final services = (snapshot.data!['services'] as List)
//               .map((e) => ServiceModel.fromJson(e))
//               .toList();
//           final featured = (snapshot.data!['featuredServices'] as List)
//               .map((e) => ServiceModel.fromJson(e))
//               .toList();
//
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Categories
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                     'Categories',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 60,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       final cat = categories[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Chip(label: Text(cat.name)),
//                       );
//                     },
//                   ),
//                 ),
//                 // Featured Services
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                     'Featured Services',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 200,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: featured.length,
//                     itemBuilder: (context, index) {
//                       final service = featured[index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   ServiceDetailsScreen(serviceId: service.id),
//                             ),
//                           );
//                         },
//                         child: Card(
//                           margin: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Container(
//                             width: 250,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Image.network(
//                                   service.serviceImage,
//                                   height: 100,
//                                   width: 250,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     service.name,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 8.0,
//                                   ),
//                                   child: Text(
//                                     '${service.price} ৳',
//                                     style: const TextStyle(color: Colors.green),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // All Services
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                     'All Services',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: services.length,
//                   itemBuilder: (context, index) {
//                     final service = services[index];
//                     return ListTile(
//                       leading: Image.network(
//                         service.serviceImage,
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       ),
//                       title: Text(service.name),
//                       subtitle: Text('${service.price} ৳'),
//                       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 ServiceDetailsScreen(serviceId: service.id),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
