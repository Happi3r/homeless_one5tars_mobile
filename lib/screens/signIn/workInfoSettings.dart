import 'package:flutter/material.dart';
import 'package:homeless/model/tag.dart';
import 'package:homeless/screens/home/homeInit.dart';
import 'package:homeless/theme/spacing.dart';

import '../../view/tags/GridTagView.dart';
import '../../widgets/genericScaffold.dart';

class WorkInfoSettingsPage extends StatefulWidget {
  const WorkInfoSettingsPage({super.key});

  @override
  State<WorkInfoSettingsPage> createState() => _WorkInfoSettingsPageState();
}

class _WorkInfoSettingsPageState extends State<WorkInfoSettingsPage> {
  List<String> works = [
    "경영·행정·사무직",
    "사회복지·종교직",
    "경찰·소방·교도직",
    "보건·의료직",
    "예술·디자인·방송직",
    "스포츠·레크리에이션직",
    "미용·예식 서비스직",
    "여행·숙박·오락 서비스직",
    "음식 서비스직",
    "돌봄 서비스직(간병·육아)",
    "청소 및 기타 개인서비스직",
    "영업·판매직",
    "운전·운송직",
    "건설·채굴직",
    "기계 설치·정비·생산직",
    "금속·재료 설치·정비·생산직(판금·단조·주조·용접·도장 등)",
    "전기·전자 설치·정비·생산직",
    "정보통신 설치·정비직",
    "화학·환경 설치·정비·생산직",
    "섬유·의복 생산직",
    "식품 가공·생산직",
    "인쇄·목재·공예 및 기타 설치·정비·생산직",
    "제조 단순직",
    "농림어업직"
  ];
  List<TagModel> selectTags = [];

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    return GenericScaffold(
      appBarTitle: "일자리 정보 추가",
      mainContent: "관심있는 직종을 선택하고\n아래 확인 버튼을 눌러주세요.",
      contentSubTitle: "관심 직종 - 복수 선택 가능",
      contentSubTitleOnAsterisk: false,
      appBarLeading: () {
        Navigator.pop(context);
      },
      okButtonAction: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeInitPage(),
          ),
        );
      },
      content: GridView.builder(
        itemCount: works.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (maxWidth / GridTagViewWidth).floor(),
            mainAxisSpacing: Spacing.md,
            crossAxisSpacing: Spacing.md,
            childAspectRatio: 2.8 / 3),
        itemBuilder: (context, index) {
          var tagModel = TagModel(
              id: index, name: works[index], image: "assets/images/img.png");
          return GridTagView(
              onClick: () {
                if (selectTags.map((e) => e.id).contains(tagModel.id)) {
                  selectTags.removeWhere((e) => e.id == tagModel.id);
                } else {
                  selectTags.add(tagModel);
                }
                setState(() {});
              },
              highlight: selectTags.map((e) => e.id).contains(tagModel.id),
              tagModel: tagModel);
        },
      ),
    );
  }
}
