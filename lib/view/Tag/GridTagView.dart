import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:homeless/model/tag.dart';
import 'package:homeless/theme/textStyle.dart';

import '../../theme/spacing.dart';

class GridTagView extends StatefulWidget {
  const GridTagView({super.key, required this.loading, required this.tagModel});

  final Bool loading;
  final TagModel tagModel;

  @override
  State<GridTagView> createState() => _GridTagViewState();
}

class _GridTagViewState extends State<GridTagView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          width: 0.7,
          color: theme.colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(Spacing.md),
      ),
      child: Column(
        children: [
          Image.network(widget.tagModel.image!),
          const SizedBox(
            height: Spacing.sm,
          ),
          Text("${widget.tagModel.name}",
              style: HomelessTextTheme.xs
                  .copyWith(color: theme.colorScheme.onPrimary))
        ],
      ),
    );
  }
}
