import 'package:flutter/material.dart';
import 'package:homeless/theme/radius.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:shimmer/shimmer.dart';

import '../../model/tag.dart';
import '../../theme/color.dart';
import '../../theme/textStyle.dart';

class Generictagview extends StatelessWidget {
  const Generictagview(
      {super.key, required this.loading, required this.onClick ,required this.tagModel});

  final bool loading;
  final VoidCallback? onClick;
  final TagModel tagModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onClick,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 110, maxHeight: 30),
        decoration: BoxDecoration(
            border: Border.all(color: HomelessColor.line, width: 0.7),
            borderRadius: BorderRadius.circular(HomelessRadius.circle)),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Row(
          children: [
                () {
              if (loading) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(HomelessRadius.md),
                  child: Shimmer.fromColors(
                    baseColor: HomelessColor.mainBlueGrey200,
                    highlightColor: HomelessColor.mainBlueGrey100,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(HomelessRadius.circle),
                        color: HomelessColor.mainBlue200,
                      ),
                    ),
                  ),
                );
              } else {
                return Image.network(
                  tagModel.image!,
                  width: 18,
                  height: 18,
                );
              }
            }(),
            const SizedBox(
              width: Spacing.sm,
            ),
                () {
              if (loading) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(HomelessRadius.md),
                  child: Shimmer.fromColors(
                    baseColor: HomelessColor.mainBlueGrey200,
                    highlightColor: HomelessColor.mainBlueGrey100,
                    child: Container(
                      width: 60,
                      height: 20,
                      color: HomelessColor.mainBlue200,
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  width: 60,
                  height: 20,
                  child: Text(
                    tagModel.name,
                    textAlign: TextAlign.center,
                    style: HomelessTextTheme.xs
                        .copyWith(color: theme.colorScheme.onPrimary),
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
