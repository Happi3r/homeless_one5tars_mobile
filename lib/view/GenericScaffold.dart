import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../screens/signIn/InputUsage.dart';
import '../theme/color.dart';
import '../theme/textStyle.dart';
import 'ContentTopSpacer.dart';

class GenericScaffold extends StatelessWidget {
  const GenericScaffold(
      {super.key,
      required this.appBarTitle,
      required this.appBarLeading,
      required this.okButtonAction,
      required this.content});

  final String appBarTitle;
  final VoidCallback appBarLeading;
  final VoidCallback okButtonAction;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "사용 목적",
          textAlign: TextAlign.start,
          style: HomelessTextTheme.lg,
        ),
        backgroundColor: Colors.white,
        elevation: 0.78,
        shadowColor: HomelessColor.text,
        leading: IconButton(
            onPressed: () {
              appBarLeading();
            },
            icon: const Icon(Icons.chevron_left)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
        child: Column(
          children: [
            const ContentSpacer(),
            SizedBox(
              width: double.infinity,
              child: Text(
                "사용 목적 정보를 입력하고\n아래 확인 다음 버튼을 눌러주세요.",
                textAlign: TextAlign.start,
                style: HomelessTextTheme.lg,
              ),
            ),
            const SizedBox(height: Spacing.xl),
            content,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "*",
                        textAlign: TextAlign.start,
                        style: HomelessTextTheme.xxs
                            .copyWith(color: HomelessColor.onError),
                      ),
                      Text(
                        " 는 필수 입력 정보입니다.",
                        textAlign: TextAlign.start,
                        style: HomelessTextTheme.xxs
                            .copyWith(color: theme.colorScheme.secondary),
                      )
                    ],
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "위의 데이터들은 더 나은 정보 제공을 위해 수집하는 목적입니다.",
                        textAlign: TextAlign.start,
                        style: HomelessTextTheme.xxs
                            .copyWith(color: theme.colorScheme.secondary),
                      )),
                  const SizedBox(height: Spacing.sm),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            side: BorderSide(
                                color: theme.colorScheme.outline, width: 0.7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          okButtonAction();
                        },
                        child: Text(
                          "확인",
                          style: HomelessTextTheme.sm
                              .copyWith(color: theme.colorScheme.onPrimary),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
