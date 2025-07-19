import 'vendor_model.dart';

class ServiceModel {
  final int id;
  final int vendorId;
  final int? staffId;
  final int status;
  final String price;
  final String prevPrice;
  final String serviceImage;
  final int zoomMeeting;
  final int calendarStatus;
  final int? maxPerson;
  final String? averageRating;
  final String? latitude;
  final String? longitude;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String slug;
  final String? address;
  final String categoryName;
  final int categoryId;
  final String categorySlug;
  final String categoryIcon;
  final VendorModel vendor;

  ServiceModel({
    required this.id,
    required this.vendorId,
    required this.staffId,
    required this.status,
    required this.price,
    required this.prevPrice,
    required this.serviceImage,
    required this.zoomMeeting,
    required this.calendarStatus,
    required this.maxPerson,
    required this.averageRating,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.slug,
    required this.address,
    required this.categoryName,
    required this.categoryId,
    required this.categorySlug,
    required this.categoryIcon,
    required this.vendor,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json['id'],
    vendorId: json['vendor_id'],
    staffId: json['staff_id'],
    status: json['status'],
    price: json['price'],
    prevPrice: json['prev_price'],
    serviceImage: json['service_image'],
    zoomMeeting: json['zoom_meeting'],
    calendarStatus: json['calendar_status'],
    maxPerson: json['max_person'],
    averageRating: json['average_rating'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    name: json['name'],
    slug: json['slug'],
    address: json['address'],
    categoryName: json['categoryName'],
    categoryId: json['categoryid'],
    categorySlug: json['categorySlug'],
    categoryIcon: json['categoryIcon'],
    vendor: VendorModel.fromJson(json['vendor']),
  );
}
