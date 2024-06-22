import 'package:flutter/material.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/textStyle.dart';

import '../../widgets/genericScaffold.dart';
import 'facilityInfo.dart';

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
      appBarTitle: "사용 목적",
      mainContent: "사용 목적 정보를 입력하고\n아래 확인 다음 버튼을 눌러주세요.",
      contentSubTitle: "사용 목적",
      contentSubTitleOnAsterisk: true,
      appBarLeading: () {
        Navigator.pop(context);
      },
      okButtonAction: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FacilityInfoPage(),
          ),
        );
      },
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
