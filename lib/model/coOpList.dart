import 'coOp.dart';
import 'json.dart';

class CoOpListModel {
  final String type;
  final String location;
  final String name;
  final RealLocationModel? realLocation;
  final String phone;

  CoOpListModel({
    required this.type,
    required this.name,
    required this.location,
    required this.realLocation,
    required this.phone,
  });

  factory CoOpListModel.fromJson(JSON json) {
    return CoOpListModel(
      type: json['type'],
      name: json['name'],
      location: json['location'],
      realLocation: json['realLocation'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "name": name,
      "location": location,
      "realLocation": "$realLocation",
      "phone": phone,
    };
  }
}
