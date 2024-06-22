import 'package:flutter/material.dart';
import 'package:homeless/screens/signIn/workInfoSettings.dart';

import '../../model/tag.dart';
import '../../theme/spacing.dart';
import '../../view/tags/GridTagView.dart';
import '../../widgets/genericScaffold.dart';

class InterestsTagSettingsPage extends StatefulWidget {
  const InterestsTagSettingsPage({super.key});

  @override
  State<InterestsTagSettingsPage> createState() =>
      _InterestsTagSettingsPageState();
}

class _InterestsTagSettingsPageState extends State<InterestsTagSettingsPage> {
  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    return GenericScaffold(
      appBarTitle: "관심사 설정하기",
      mainContent: "알람을 받기 위한 관심사를 선택하고\n아래 확인 다음 버튼을 눌러주세요.",
      contentSubTitle: "관심 지원사업 - 복수 선택 가능",
      contentSubTitleOnAsterisk: false,
      appBarLeading: () {
        Navigator.pop(context);
      },
      okButtonAction: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WorkInfoSettingsPage()),
        );
      },
      content: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (maxWidth / GridTagViewWidth).floor(),
          mainAxisSpacing: Spacing.md,
          crossAxisSpacing: Spacing.md,
        ),
        itemBuilder: (context, index) {
          return GridTagView(
            onClick: () {},
            highlight: false,
            tagModel: const TagModel(
                id: 1,
                name: "앙 기모찌 지원사업띠",
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/WebCrawlerArchitecture.svg/1200px-WebCrawlerArchitecture.svg.png"),
          );
        },
      ),
    );
  }
}
