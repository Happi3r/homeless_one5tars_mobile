import 'dart:ffi';

import 'json.dart';

class CoOpModel {
  final String? name;
  final String? location;
  final RealLocationModel? realLocation;
  final String? description;
  final String? phone;
  final String? baseUrl;
  final String? mainImage;
  final List<String>? subImages;

  const CoOpModel({
    required this.name,
    required this.location,
    required this.realLocation,
    required this.description,
    required this.phone,
    required this.baseUrl,
    required this.mainImage,
    required this.subImages,
  });

  factory CoOpModel.fromJson(JSON json) {
    return CoOpModel(
      name: json['name'],
      location: json['location'],
      realLocation: json['realLocation'],
      description: json['description'],
      phone: json['phone'],
      baseUrl: json['baseUrl'],
      mainImage: json['mainImage'],
      subImages: json['subImages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": "$name",
      "location": "$location",
      "realLocation": "$realLocation",
      "description": "$description",
      "phone": "$phone",
      "baseUrl": "$baseUrl",
      "mainImage": "$mainImage",
      "subImages": "$subImages",
    };
  }
}

class RealLocationModel {
  final Double? lat;
  final Double? lng;

  const RealLocationModel({required this.lat, required this.lng});

  factory RealLocationModel.fromJson(JSON json) {
    return RealLocationModel(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lat": "$lat",
      "lng": "$lng",
    };
  }
}
