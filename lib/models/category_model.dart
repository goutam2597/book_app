class CategoryModel {
  final int id;
  final String name;
  final String icon;
  final String image;
  final String slug;
  final int languageId;
  final int serialNumber;
  final int status;
  final String createdAt;
  final String updatedAt;
  final String backgroundColor;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.image,
    required this.slug,
    required this.languageId,
    required this.serialNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.backgroundColor,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'],
    name: json['name'],
    icon: json['icon'],
    image: json['image'],
    slug: json['slug'],
    languageId: json['language_id'],
    serialNumber: json['serial_number'],
    status: json['status'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    backgroundColor: json['background_color'],
  );
}
