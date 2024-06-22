import 'coOp.dart';
import 'json.dart';

class CoOpListModel {
  final String type;
  final String location;
  final String name;
  final double? lat;
  final double? lng;
  final String phone;

  CoOpListModel({
    required this.type,
    required this.name,
    required this.location,
    required this.lat,
    required this.lng,
    required this.phone,
  });

  factory CoOpListModel.fromJson(JSON json) {
    return CoOpListModel(
      type: json['type'],
      name: json['name'],
      location: json['location'],
      lat: json['lat'],
      lng: json['lng'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "name": name,
      "location": location,
      "lat": "$lat",
      "lng": "$lng",
      "phone": phone,
    };
  }
}
