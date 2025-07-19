class VendorModel {
  final int id;
  final String photo;
  final String email;
  final String recivedEmail;
  final String phone;
  final String username;
  final int status;

  VendorModel({
    required this.id,
    required this.photo,
    required this.email,
    required this.recivedEmail,
    required this.phone,
    required this.username,
    required this.status,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
    id: json['id'],
    photo: json['photo'],
    email: json['email'] ?? '',
    recivedEmail: json['recived_email'] ?? '',
    phone: json['phone'] ?? '',
    username: json['username'] ?? '',
    status: json['status'],
  );
}
