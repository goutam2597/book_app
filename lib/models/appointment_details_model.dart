class AppointmentDetailsModel {
  final int id;
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final String bookingDate;
  final String startDate;
  final String endDate;
  final String customerPaid;
  final String paymentStatus;
  final String orderStatus;
  final String serviceName;
  final String serviceAddress;
  final String serviceDescription;
  final String staffName;
  final String vendorName;
  final String vendorPhone;
  final String vendorEmail;

  AppointmentDetailsModel({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    required this.bookingDate,
    required this.startDate,
    required this.endDate,
    required this.customerPaid,
    required this.paymentStatus,
    required this.orderStatus,
    required this.serviceName,
    required this.serviceAddress,
    required this.serviceDescription,
    required this.staffName,
    required this.vendorName,
    required this.vendorPhone,
    required this.vendorEmail,
  });

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
    final appointment = json['appointment'];
    final serviceContent = appointment['service_content'][0];
    final staff = json['staff'] ?? {};
    final vendor = json['vendor'] ?? {};

    return AppointmentDetailsModel(
      id: appointment['id'],
      customerName: appointment['customer_name'] ?? '',
      customerPhone: appointment['customer_phone'] ?? '',
      customerEmail: appointment['customer_email'] ?? '',
      bookingDate: appointment['booking_date'] ?? '',
      startDate: appointment['start_date'] ?? '',
      endDate: appointment['end_date'] ?? '',
      customerPaid: appointment['customer_paid'] ?? '',
      paymentStatus: appointment['payment_status'] ?? '',
      orderStatus: appointment['order_status'] ?? '',
      serviceName: serviceContent['name'] ?? '',
      serviceAddress: serviceContent['address'] ?? '',
      serviceDescription: serviceContent['description'] ?? '',
      staffName: staff['name'] ?? '',
      vendorName: vendor['name'] ?? '',
      vendorPhone: vendor['phone'] ?? '',
      vendorEmail: vendor['email'] ?? '',
    );
  }
}

