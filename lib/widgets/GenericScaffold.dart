import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:homeless/widgets/Button.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../screens/signIn/InputUsage.dart';
import '../theme/color.dart';
import '../theme/textStyle.dart';
import 'ContentTopSpacer.dart';

class GenericScaffold extends StatelessWidget {
  const GenericScaffold(
      {super.key,
      required this.appBarTitle,
      required this.mainContent,
      required this.contentSubTitle,
      required this.contentSubTitleOnAsterisk,
      required this.appBarLeading,
      required this.okButtonAction,
      required this.content});

  final String appBarTitle;
  final String mainContent;
  final String contentSubTitle;
  final bool contentSubTitleOnAsterisk;
  final Widget content;
  final VoidCallback appBarLeading;
  final VoidCallback okButtonAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          appBarTitle,
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
                  mainContent,
                  textAlign: TextAlign.start,
                  style: HomelessTextTheme.lg,
                ),
              ),
              const SizedBox(height: Spacing.lg),
              Row(
                children: [
                  Text(contentSubTitle, style: HomelessTextTheme.sm),
                  contentSubTitleOnAsterisk ? Text(" *", style: HomelessTextTheme.sm.copyWith(color: HomelessColor.onError),) : Container()
                ],
              ),
              const SizedBox(height: Spacing.xl),
              Expanded(
                child: content,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: Spacing.sm),
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
                      child: HomelessTextButton(
                          buttonText: "확인", buttonAction: okButtonAction))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
