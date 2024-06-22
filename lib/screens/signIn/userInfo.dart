import 'package:flutter/material.dart';
import 'package:homeless/screens/signIn/inputUsage.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:homeless/theme/textStyle.dart';

import '../../widgets/genericScaffold.dart';
import 'facilityInfo.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBarTitle: "유저 정보",
      mainContent: "회원가입할 정보를 확인해 주세요",
      contentSubTitle: "유저 정보",
      contentSubTitleOnAsterisk: true,
      appBarLeading: () {},
      okButtonAction: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InputUsagePage(),
          ),
        );
      },
      content: const SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "유저 이름: ",
              textAlign: TextAlign.start,
            ),
            SizedBox(height: Spacing.sm,),
            Text(
              "이재원",
              textAlign: TextAlign.start,
            ),
            SizedBox(height: Spacing.lg,),
            Text("유저 email: "),
            SizedBox(height: Spacing.sm,),
            Text(
              "jwleetop5@naver.com",
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
