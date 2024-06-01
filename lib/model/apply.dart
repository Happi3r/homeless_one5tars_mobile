import 'package:homeless/model/post.dart';
import 'package:homeless/model/user.dart';

import '../api/api.dart';

class Apply {
  final String userId;
  final Post post;
  final DateTime date;

  Apply({
    required this.userId,
    required this.post,
    required this.date
  });

  factory Apply.fromJson(JSON json) {
    return Apply(
      userId: json['userId'],
      post: json['post'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "post": post,
      "date": date,
    };
  }
}