import 'package:flutter/material.dart';
import 'package:homeless/theme/spacing.dart';

import '../theme/textStyle.dart';

enum ButtonType {
  Default,
  Error,
  Success,
  Disable,
  Dense,
}

class HomelessTextButton extends StatelessWidget {
  const HomelessTextButton(
      {super.key,
      required this.buttonText,
      required this.buttonAction,
      this.type = ButtonType.Default,
      this.width,
      this.height});

  final VoidCallback buttonAction;
  final double? width;
  final double? height;
  final String buttonText;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    var textColor = switch (type) {
      ButtonType.Default || ButtonType.Disable => theme.colorScheme.onPrimary,
      ButtonType.Dense => theme.colorScheme.onPrimary,
      ButtonType.Error => theme.colorScheme.onError,
      ButtonType.Success => theme.colorScheme.onTertiary
    };
    var buttonBack = switch (type) {
      ButtonType.Default || ButtonType.Dense => theme.colorScheme.primary,
      ButtonType.Disable => theme.colorScheme.outline,
      ButtonType.Error => theme.colorScheme.error,
      ButtonType.Success => theme.colorScheme.tertiary
    };
    return Container(
      width: width ?? size.width - 32,
      height: height ?? size.height,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      constraints: BoxConstraints(minHeight: height ?? 60),
      decoration: BoxDecoration(
        color: buttonBack,
        border: Border.all(color: theme.colorScheme.outline, width: 0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: buttonAction,
        child: Center(
          child: Text(
            buttonText,
            style: HomelessTextTheme.sm.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
