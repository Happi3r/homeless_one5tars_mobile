import 'package:homeless/api/api.dart';

class Schedule {
  final String id; // user Id
  final DateTime startDate;
  final DateTime endDate;
  final String title;
  final String description;

  Schedule({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.description,
  });

  factory Schedule.fromJson(JSON json) {
    return Schedule(
        id: json['id'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        title: json['title'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": "$id",
      "startDate": "$startDate",
      "endDate": "$endDate",
      "title": "$title",
      "description": "$description",
    };
  }
}
