import 'package:flutter/material.dart';
import 'package:homeless/model/work-post.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/radius.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:homeless/theme/textStyle.dart';
import 'package:homeless/view/tags/GenericTagView.dart';
import 'package:shimmer/shimmer.dart';

import '../model/tag.dart';

class WorkPostView extends StatelessWidget {
  const WorkPostView(
      {super.key, required this.loading, required this.onClick,required this.workPost});

  final bool loading;
  final VoidCallback? onClick;
  final WorkPostModel? workPost;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxHeight: 150),
        padding: const EdgeInsets.only(
            left: Spacing.xxs, top: Spacing.xxs, right: Spacing.xxs),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  () {
                if (loading || workPost == null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(HomelessRadius.circle),
                    child: Shimmer.fromColors(
                      baseColor: HomelessColor.mainBlueGrey200,
                      highlightColor: HomelessColor.mainBlueGrey100,
                      child: Container(
                        width: 180,
                        height: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(HomelessRadius.circle),
                          color: HomelessColor.mainBlue200,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Text(
                    workPost!.title,
                    overflow: TextOverflow.ellipsis,
                    style: HomelessTextTheme.md.copyWith(fontFamily: 'SemiBold'),
                  );
                }
              }(),
              const SizedBox(
                height: Spacing.sm,
              ),
                  () {
                if (loading || workPost == null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(HomelessRadius.circle),
                    child: Shimmer.fromColors(
                      baseColor: HomelessColor.mainBlueGrey200,
                      highlightColor: HomelessColor.mainBlueGrey100,
                      child: Container(
                        width: 60,
                        height: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(HomelessRadius.circle),
                          color: HomelessColor.mainBlue200,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Text(
                    workPost!.findJobType,
                    style: HomelessTextTheme.sm,
                  );
                }
              }(),
              const SizedBox(
                height: Spacing.sm,
              ),
              const Row(
                children: [
                  Generictagview(
                    loading: false,
                    onClick: null,
                    tagModel: TagModel(
                        id: 1,
                        name: "asdas",
                        image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS6mx9y6iAkwEdCGYoCieUgjcq8ioWXV79Lg&s"),
                  ),
                  SizedBox(
                    width: Spacing.sm,
                  ),
                  Generictagview(
                    loading: true,
                    onClick: null,
                    tagModel: TagModel(id: 2, name: "ads", image: "ads"),
                  )
                ],
              ),
              const SizedBox(
                height: Spacing.sm,
              ),
              const Divider(
                thickness: 0.7,
                color: HomelessColor.line,
              )
            ],
          ),
        ),
      ),
    );
  }
}
