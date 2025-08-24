import 'package:degdeg_app/model/adeegyadaModel.dart';

class ShirkadaModel {
  String? name;
  String? img;
  List<AdeegyadaModel>? adeegyada;
  List<SlidersModel>? sliders;
  ShirkadaModel({
    required this.name,
    required this.img,
    this.adeegyada,
    this.sliders,
  });

  factory ShirkadaModel.fromJson(Map<String, dynamic> json) {
    return ShirkadaModel(
      name: json['name'],
      img: json['logo'],
      adeegyada: json['packages'] != null
          ? (json['packages'] as List)
              .map((e) => AdeegyadaModel.fromJson(e))
              .toList()
          : null,
      sliders: json['slider'] != null
          ? (json['slider'] as List)
              .map((e) => SlidersModel.fromJson(e))
              .toList()
          : null,
    );
  }

  toJson() {}
}

class SlidersModel {
  final String? subject;
  final String? slider;
  final String? url;

  SlidersModel({
    required this.subject,
    required this.slider,
    this.url,
  });

  factory SlidersModel.fromJson(Map<String, dynamic> json) {
    return SlidersModel(
      subject: json['subject'] ?? '',
      slider: json['slider'] ?? '',
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'slider': slider,
      'url': url,
    };
  }
  
}
