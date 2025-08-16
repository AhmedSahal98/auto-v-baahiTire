class ServiceDetailModel {
  String price;
  String? orignalPrice;
  String? label;
  String? data_bundle;
  String? sms_bundle;
  String? airtime_bundle;
  int? iptv;
  PaymentModel payment;

  ServiceDetailModel({
    required this.price,
    required this.orignalPrice,
    required this.label,
    required this.airtime_bundle,
    required this.sms_bundle,
    required this.data_bundle,
    required this.iptv,
    required this.payment,
  });

  factory ServiceDetailModel.fromJson(Map<String, dynamic> json) {
    return ServiceDetailModel(
      price: json['price']?? '',
      orignalPrice: json['orignal_price'] ?? '',
      label: json['label'],
      airtime_bundle: json['airtime_bundle'],
      sms_bundle: json['sms_bundle'],
      data_bundle: json['data_bundle'],
      iptv: json['iptv'],
      payment: PaymentModel.fromJson(json['payment'] ?? {}),
    );
  }
}

class PaymentModel {
  final String paymentMethod;
  final String helpText;
  final String callUssd;

  PaymentModel({
    required this.paymentMethod,
    required this.helpText,
    required this.callUssd,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      paymentMethod: json['payment_method'] ?? '',
      helpText: json['help_text'] ?? '',
      callUssd: json['call_ussd'] ?? '',
    );
  }
}
