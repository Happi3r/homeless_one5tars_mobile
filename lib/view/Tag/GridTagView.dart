import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:homeless/model/tag.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/radius.dart';
import 'package:homeless/theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

import '../../theme/spacing.dart';

class GridTagView extends StatefulWidget {
  const GridTagView({super.key, required this.loading, required this.tagModel});

  final bool loading;
  final TagModel tagModel;

  @override
  State<GridTagView> createState() => _GridTagViewState();
}

const GridTagViewWidth = 120.0;
const GridTagViewHeight = 150.0;

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
          color: theme.colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(Spacing.md),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: () {
              if (widget.loading) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(Radius.md),
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
                return Image.network(
                  widget.tagModel.image!,
                  width: 60,
                  height: 60,
                );
              }
            }(),
          ),
          const SizedBox(
            height: Spacing.sm,
          ),
          () {
            if (widget.loading) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(Radius.md),
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
                  "${widget.tagModel.name}",
                  textAlign: TextAlign.center,
                  style: HomelessTextTheme.xxs
                      .copyWith(color: theme.colorScheme.onPrimary),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }
          }(),
        ],
      ),
    );
  }
}
