import 'package:flutter/material.dart';

import '../../widgets/GenericScaffold.dart';

class WorkInfoSettingsPage extends StatefulWidget {
  const WorkInfoSettingsPage({super.key});

  @override
  State<WorkInfoSettingsPage> createState() => _WorkInfoSettingsPageState();
}

class _WorkInfoSettingsPageState extends State<WorkInfoSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBarTitle:  "일자리 정보 추가",
      mainContent: "관심있는 직종을 선택하고\n아래 확인 버튼을 눌러주세요.",
      appBarLeading: () {
        Navigator.pop(context);
      },
      okButtonAction: () {
      },
      content: Container(),
    );
  }
}
