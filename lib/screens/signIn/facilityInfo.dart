import 'package:flutter/material.dart';
import 'package:homeless/screens/signIn/workInfoSettings.dart';

import '../../model/tag.dart';
import '../../theme/spacing.dart';
import '../../view/Tag/GridTagView.dart';
import '../../widgets/GenericScaffold.dart';
import 'interestsTagSettings.dart';

class FacilityInfoPage extends StatefulWidget {
  const FacilityInfoPage({super.key});

  @override
  State<FacilityInfoPage> createState() => _FacilityInfoPageState();
}

class _FacilityInfoPageState extends State<FacilityInfoPage> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBarTitle:  "현재 시설 정보",
      mainContent: "현재 묵고계신 시설 정보를 입력하고\n아래 확인 다음 버튼을 눌러주세요.",
      contentSubTitle: "현재 묵고계신 시설을 알려주세요",
      contentSubTitleOnAsterisk: false,
      appBarLeading: () {
        Navigator.pop(context);
      },
      okButtonAction: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InterestsTagSettingsPage()),
        );
      },
      content: const Column(
        children: [
          
        ],
      ),
    );
  }
}
