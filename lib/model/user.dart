import 'package:homeless/model/tag.dart';
import 'package:homeless/screens/signIn/InputUsage.dart';

import '../api/api.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String organization;
  final String phone;
  final String birth;
  final UserRule rule;
  final String idle;
  final List<TagModel> tags;
  final bool goOut;
  final DateTime goOutTime;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.organization,
    required this.phone,
    required this.birth,
    required this.rule,
    required this.idle,
    required this.tags,
    required this.goOut,
    required this.goOutTime,
  });

  factory User.fromJson(JSON json) {
    return User(id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        organization: json['organization'],
        phone: json['phone'],
        birth: json['birth'],
        rule: json['rule'],
        idle: json['idle'],
        tags: json['tags'],
        goOut: json['goOut'],
        goOutTime: json['goOutTime']);
  }
}


