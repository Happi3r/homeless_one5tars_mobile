import 'package:flutter/material.dart';
import 'package:homeless/screens/signIn/workInfoSettings.dart';

import '../../widgets/GenericScaffold.dart';

class InterestsTagSettingsPage extends StatefulWidget {
  const InterestsTagSettingsPage({super.key});

  @override
  State<InterestsTagSettingsPage> createState() => _InterestsTagSettingsPageState();
}

class _InterestsTagSettingsPageState extends State<InterestsTagSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBarTitle:  "관심사 설정하기",
      mainContent: "알람을 받기 위한 관심사를 선택하고\n아래 확인 다음 버튼을 눌러주세요.",
      appBarLeading: () {
        Navigator.pop(context);
      },
      okButtonAction: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WorkInfoSettingsPage()),
        );
      },
      content: Container(),
    );
  }
}
