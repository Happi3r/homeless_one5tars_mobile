import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:homeless/model/tag.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/radius.dart';
import 'package:homeless/theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

import '../../theme/spacing.dart';

class GridTagView extends StatefulWidget {
  const GridTagView(
      {super.key,
      required this.tagModel,
      required this.highlight,
      required this.onClick,
      this.loading = false});

  final bool loading;
  final bool highlight;
  final TagModel tagModel;
  final VoidCallback onClick;

  @override
  State<GridTagView> createState() => _GridTagViewState();
}

const GridTagViewWidth = 120.0;
const GridTagViewHeight = 160.0;

class _GridTagViewState extends State<GridTagView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(
          maxWidth: GridTagViewWidth, maxHeight: GridTagViewHeight),
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          width: 0.7,
          color: widget.highlight
              ? HomelessColor.mainBlue700
              : theme.colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(Spacing.md),
      ),
      child: InkWell(
        onTap: () {
          widget.onClick.call();
          setState(() {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: () {
                if (widget.loading) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(HomelessRadius.md),
                    child: Shimmer.fromColors(
                      baseColor: HomelessColor.mainBlueGrey200,
                      highlightColor: HomelessColor.mainBlueGrey100,
                      child: Container(
                        width: 60,
                        height: 60,
                        color: HomelessColor.mainBlue200,
                      ),
                    ),
                  );
                } else {
                  return Image.asset(
                    widget.tagModel.image!,
                    width: 60,
                    height: 60,
                  );
                }
              }(),
            ),
            () {
              if (widget.loading) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(HomelessRadius.md),
                  child: Shimmer.fromColors(
                    baseColor: HomelessColor.mainBlueGrey200,
                    highlightColor: HomelessColor.mainBlueGrey100,
                    child: Container(
                      width: 80,
                      height: 15,
                      color: HomelessColor.mainBlue200,
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.tagModel.name,
                    textAlign: TextAlign.center,
                    style: HomelessTextTheme.xs
                        .copyWith(color: theme.colorScheme.onPrimary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }
            }(),
          ],
        ),
      ),
    );
  }
}
