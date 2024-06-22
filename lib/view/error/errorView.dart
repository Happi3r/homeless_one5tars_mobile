import 'package:flutter/material.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:homeless/widgets/button.dart';

import '../../theme/textStyle.dart';

class ErrorView extends StatefulWidget {
  const ErrorView({super.key, required this.refresh});

  final VoidCallback refresh;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: HomelessColor.error,
          ),
          const SizedBox(
            height: Spacing.sm,
          ),
          Text(
            "에러가 발생했습니다.\n네트워크를 확인해주세요",
            textAlign: TextAlign.center,
            style: HomelessTextTheme.sm.copyWith(color: theme.onPrimary),
          ),
          const SizedBox(
            height: Spacing.sm,
          ),
          InkWell(
            onTap: () {
              widget.refresh.call();
            },
            hoverColor: Colors.black,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.sm),
                constraints: const BoxConstraints(minHeight: 40),
                decoration: BoxDecoration(
                  color: theme.primary,
                  border: Border.all(color: theme.outline, width: 0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "다시 시도하기",
                    style:
                        HomelessTextTheme.sm.copyWith(color: theme.onPrimary),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
