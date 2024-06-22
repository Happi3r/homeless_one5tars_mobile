import 'dart:ffi';

import 'json.dart';

class CoOpModel {
  final String uuid;
  final DateTime createdAt;
  final String name;
  final String location;
  final double? lat;
  final double? lng;
  final String? description;
  final String? phone;
  final String? baseUrl;
  final String? mainImage;
  final List<dynamic>? subImages;

  const CoOpModel({
    required this.uuid,
    required this.createdAt,
    required this.name,
    required this.location,
    required this.lat,
    required this.lng,
    required this.description,
    required this.phone,
    required this.baseUrl,
    required this.mainImage,
    required this.subImages,
  });

  factory CoOpModel.fromJson(JSON json) {
    return CoOpModel(
      uuid: json['uuid'],
      createdAt: DateTime.parse(json['createdAt']),
      name: json['name'],
      location: json['location'],
      lat: json['lat'] == 0 ? 0.0 : json['lat'],
      lng: json['lng'] == 0 ? 0.0 : json['lng'],
      description: json['description'],
      phone: json['phone'],
      baseUrl: json['baseUrl'],
      mainImage: json['mainImage'],
      subImages: json['subImages'],
    );
  }
}

