import 'package:baahiTire_app/model/serviceDetailModel.dart';

class AdeegyadaModel {
  String name;
  String image;
  // String selectedImage;
  List<ServiceDetailModel>? serviceDetails;

  AdeegyadaModel({
    required this.name,
    required this.image,
    // required this.selectedImage,
    this.serviceDetails,
  });

  factory AdeegyadaModel.fromJson(Map<String, dynamic> json) {
    return AdeegyadaModel(
      name: json['name'],
      image: json['icon'],
      // selectedImage: json['selectedImage'],
      serviceDetails: json['bundle'] != null
          ? (json['bundle'] as List)
              .map((e) => ServiceDetailModel.fromJson(e))
              .toList()
          : null,
    );
  }
}
