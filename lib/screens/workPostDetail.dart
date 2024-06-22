import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homeless/model/work-post.dart';
import 'package:homeless/screens/webView.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:intl/intl.dart';
import 'package:homeless/theme/textStyle.dart';

import '../widgets/button.dart';

class WorkPostDetail extends StatefulWidget {
  const WorkPostDetail({super.key, required this.workPostModel});

  final WorkPostModel workPostModel;

  @override
  State<WorkPostDetail> createState() => _WorkPostDetailState();
}

const double cellMinimumHeight = 40;

class _WorkPostDetailState extends State<WorkPostDetail> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final String addDate = formatter.format(widget.workPostModel.addDate);
    final String? endDate = widget.workPostModel.endDate == null
        ? widget.workPostModel.endDateString
        : formatter.format(widget.workPostModel.endDate!);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.workPostModel.title,
          style: HomelessTextTheme.md,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: Spacing.xl,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.workPostModel.title,
                    textAlign: TextAlign.start,
                    style: HomelessTextTheme.lg.copyWith(fontFamily: 'Bold'),
                  ),
                ),
                const SizedBox(height: Spacing.sm),
                Row(
                  children: [
                    Text(
                      addDate,
                      style: HomelessTextTheme.xs
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                    () {
                      if (endDate != null) {
                        return Text(
                          " ~ $endDate",
                          style: HomelessTextTheme.xs
                              .copyWith(color: theme.colorScheme.secondary),
                        );
                      } else {
                        return Container();
                      }
                    }()
                  ],
                ),
                const SizedBox(height: Spacing.md),
                Expanded(
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    children: [
                      _detailView(
                          crossAxisCellCount: 1,
                          mainAxisExtent: cellMinimumHeight,
                          text: "구인상태"),
                      _detailView(
                          crossAxisCellCount: 3,
                          mainAxisExtent: cellMinimumHeight,
                          text: "${widget.workPostModel.state}"),
                      _detailView(
                          crossAxisCellCount: 1,
                          mainAxisExtent: cellMinimumHeight * 3,
                          text: "업체정보"),
                      _detailView(
                          crossAxisCellCount: 1,
                          mainAxisExtent: cellMinimumHeight,
                          text: "업체명"),
                      _detailView(
                          crossAxisCellCount: 2,
                          mainAxisExtent: cellMinimumHeight,
                          text: "${widget.workPostModel.companyName}"),
                      _detailView(
                          crossAxisCellCount: 1,
                          mainAxisExtent: cellMinimumHeight,
                          text: "위치"),
                      _detailView(
                          crossAxisCellCount: 2,
                          mainAxisExtent: cellMinimumHeight,
                          text: "${widget.workPostModel.companyLocation}"),
                      _detailView(
                          crossAxisCellCount: 1,
                          mainAxisExtent: cellMinimumHeight,
                          text: "회사 업종"),
                      _detailView(
                        crossAxisCellCount: 2,
                        mainAxisExtent: cellMinimumHeight,
                        text: "${widget.workPostModel.companyJobType}",
                      ),
                      _detailView(
                        crossAxisCellCount: 1,
                        mainAxisExtent: cellMinimumHeight * 6,
                        text: "구인내용",
                      ),
                      _detailView(
                        crossAxisCellCount: 1,
                        mainAxisExtent: cellMinimumHeight,
                        text: "모집직종",
                      ),
                      _detailView(
                        crossAxisCellCount: 2,
                        mainAxisExtent: cellMinimumHeight,
                        text: "${widget.workPostModel.findJobType}",
                      ),
                      _detailView(
                        crossAxisCellCount: 1,
                        mainAxisExtent: cellMinimumHeight,
                        text: "모집인원",
                      ),
                      _detailView(
                        crossAxisCellCount: 2,
                        mainAxisExtent: cellMinimumHeight,
                        text: "${widget.workPostModel.personnel}",
                      ),
                      _detailView(
                        crossAxisCellCount: 1,
                        mainAxisExtent: cellMinimumHeight,
                        text: "급여",
                      ),
                      _detailView(
                        crossAxisCellCount: 2,
                        mainAxisExtent: cellMinimumHeight,
                        text: "${widget.workPostModel.pay}",
                      ),
                      _detailView(
                        crossAxisCellCount: 1,
                        mainAxisExtent: cellMinimumHeight,
                        text: "근무시간",
                      ),
                      _detailView(
                        crossAxisCellCount: 2,
                        mainAxisExtent: cellMinimumHeight,
                        text: "${widget.workPostModel.workingHours}",
                      ),
                      _detailView(
                        crossAxisCellCount: 1,
                        mainAxisExtent: cellMinimumHeight,
                        text: "복리후생",
                      ),
                      _detailView(
                        crossAxisCellCount: 2,
                        mainAxisExtent: cellMinimumHeight,
                        text: "${widget.workPostModel.welfare}",
                      ),
                      _detailView(
                        crossAxisCellCount: 1,
                        mainAxisExtent: cellMinimumHeight,
                        text: "근무 장소",
                      ),
                      _detailView(
                        crossAxisCellCount: 2,
                        mainAxisExtent: cellMinimumHeight,
                        text: "${widget.workPostModel.workingLocation}",
                      ),
                      _detailView(
                        crossAxisCellCount: 1,
                        mainAxisExtent: cellMinimumHeight * 4.5,
                        text: "기타사항",
                      ),
                      StaggeredGridTile.extent(
                        crossAxisCellCount: 3,
                        mainAxisExtent: cellMinimumHeight * 4.5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: HomelessColor.line, width: 0.7),
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SingleChildScrollView(
                              child: Text(
                                widget.workPostModel.otherInfo + "\n",
                                maxLines: 50,
                                style: HomelessTextTheme.xs,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: Spacing.sm,
              child: HomelessTextButton(
                height: 35,
                buttonText: "지원하기",
                buttonAction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _detailView({
  required int crossAxisCellCount,
  required double mainAxisExtent,
  required String text,
  int maxLines = 2,
}) {
  return StaggeredGridTile.extent(
    crossAxisCellCount: crossAxisCellCount,
    mainAxisExtent: mainAxisExtent,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: HomelessColor.line, width: 0.7),
      ),
      child: Center(
        child: Text(
          text,
          maxLines: maxLines,
          style: HomelessTextTheme.xs,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
  );
}
