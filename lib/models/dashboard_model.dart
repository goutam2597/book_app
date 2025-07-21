class DashboardModel {
  final int wishlistsCount;
  final int appointmentsCount;
  final int ordersCount;

  DashboardModel({
    required this.wishlistsCount,
    required this.appointmentsCount,
    required this.ordersCount,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      wishlistsCount: json['wishlistsCount'] ?? 0,
      appointmentsCount: json['appointmentsCount'] ?? 0,
      ordersCount: json['ordersCount'] ?? 0,
    );
  }
}
