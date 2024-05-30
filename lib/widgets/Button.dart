import 'package:flutter/material.dart';

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
      this.type = ButtonType.Default});

  final VoidCallback buttonAction;
  final String buttonText;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
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
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonBack,
        side: BorderSide(color: theme.colorScheme.outline, width: 0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        buttonAction();
      },
      child: Text(
        buttonText,
        style: HomelessTextTheme.sm.copyWith(color: textColor),
      ),
    );
  }
}
