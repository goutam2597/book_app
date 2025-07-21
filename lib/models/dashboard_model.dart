class DashboardModel {
  final int wishlistsCount;
  final int appointmentsCount;
  final int ordersCount;
  final String userName;
  final String userEmail;
  final String? userPhoto; // Nullable

  DashboardModel({
    required this.wishlistsCount,
    required this.appointmentsCount,
    required this.ordersCount,
    required this.userName,
    required this.userEmail,
    this.userPhoto,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    final user = json['authUser'] ?? {};
    return DashboardModel(
      wishlistsCount: json['wishlistsCount'] ?? 0,
      appointmentsCount: json['appointmentsCount'] ?? 0,
      ordersCount: json['ordersCount'] ?? 0,
      userName: user['name'] ?? '',
      userEmail: user['email'] ?? '',
      userPhoto: user['image'],
    );
  }
}
