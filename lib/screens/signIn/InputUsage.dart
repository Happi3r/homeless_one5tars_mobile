import 'package:flutter/material.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/textStyle.dart';
import 'package:homeless/view/ContentTopSpacer.dart';

import '../../view/GenericScaffold.dart';

class InputUsagePage extends StatefulWidget {
  const InputUsagePage({super.key});

  @override
  State<InputUsagePage> createState() => _InputUsagePageState();
}

class _InputUsagePageState extends State<InputUsagePage> {
  UserRule rule = UserRule.NotRole;

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBarTitle:  "사용 목적",
      appBarLeading: () {},
      okButtonAction: () {},
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: UserRule.values.map((e) {
          return RadioListTile(
              contentPadding: const EdgeInsets.only(right: 0),
              title: Text(
                e.name,
                style: HomelessTextTheme.lg,
              ),
              value: e,
              groupValue: rule,
              activeColor: HomelessColor.success,
              onChanged: (value) {
                rule = value!;
                setState(() {});
              });
        }).toList(),
      ),
    );
  }
}

enum UserRule {
  Admin(name: "시설 관리자"),
  User(name: "시설 이용자"),
  NotRole(name: "없음");

  final String name;

  const UserRule({required this.name});
}
