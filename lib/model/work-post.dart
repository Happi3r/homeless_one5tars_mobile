import 'dart:core';

import 'json.dart';

class WorkPostModel {
  final String id;
  final String title;
  final String state;
  final String webView;
  final DateTime addDate;
  final String? companyName;
  final String? companyLocation;
  final String? companyJobType;
  final String findJobType;
  final String personnel;
  final String pay;
  final String workingHours;
  final String? welfare;
  final String workingLocation;
  final DateTime? endDate;
  final String? endDateString;
  final String otherInfo;

  const WorkPostModel({
    required this.id,
    required this.title,
    required this.state,
    required this.webView,
    required this.addDate,
    required this.companyName,
    required this.companyLocation,
    required this.companyJobType,
    required this.findJobType,
    required this.personnel,
    required this.pay,
    required this.workingHours,
    required this.welfare,
    required this.workingLocation,
    required this.endDate,
    required this.endDateString,
    required this.otherInfo,
  });

  factory WorkPostModel.fromJson(JSON json) {
    return WorkPostModel(
      id: json['id'],
      title: json['title'],
      state: json['state'],
      webView: json['webView'],
      addDate: json['addDate'],
      companyName: json['companyName'],
      companyLocation: json['companyLocation'],
      companyJobType: json['companyJobType'],
      findJobType: json['findJobType'],
      personnel: json['personnel'],
      pay: json['pay'],
      workingHours: json['workingHours'],
      welfare: json['welfare'],
      workingLocation: json['workingLocation'],
      endDate: json['endDate'],
      endDateString: json['endDateString'],
      otherInfo: json['otherInfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": "$id",
      "title": "$title",
      "state": "$state",
      "webView": "$webView",
      "addDate": "$addDate",
      "companyName": "$companyName",
      "companyLocation": "$companyLocation",
      "companyJobType": "$companyJobType",
      "findJobType": "$findJobType",
      "personnel": "$personnel",
      "pay": "$pay",
      "workingHours": "$workingHours",
      "welfare": "$welfare",
      "workingLocation": "$workingLocation",
      "endDate": "$endDate",
      "endDateString": "$endDateString",
      "otherInfo": "$otherInfo",
    };
  }
}
