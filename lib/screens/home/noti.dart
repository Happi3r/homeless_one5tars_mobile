import 'package:flutter/material.dart';
import 'package:homeless/api/api.dart';
import 'package:homeless/model/tag.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:homeless/view/error/errorView.dart';

import '../../model/work-post.dart';
import '../../view/tags/GenericTagView.dart';
import '../../view/workPostView.dart';
import '../workPostDetail.dart';

class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  Future<List<WorkPostModel>>? _workPostModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWorkPosts();
  }

  void _fetchWorkPosts() {
    setState(() {
      _workPostModel = Api.fetchWorkPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
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
                  width: 10,
                ),
                Generictagview(
                  loading: true,
                  onClick: null,
                  tagModel: TagModel(id: 2, name: "ads", image: "ads"),
                )
              ],
            ),
            const SizedBox(
              height: Spacing.lg,
            ),
            FutureBuilder(
              future: _workPostModel,
              builder: (context, snapshot) {
                if (snapshot.hasError &&
                    snapshot.connectionState != ConnectionState.waiting) {
                  return ErrorView(
                    refresh: _fetchWorkPosts,
                  );
                }
                if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return const WorkPostView(
                          loading: true,
                          onClick: null,
                          workPost: null,
                        );
                      },
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return WorkPostView(
                        loading: false,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return WorkPostDetail(
                                  workPostModel: snapshot.data![index],
                                );
                              },
                            ),
                          );
                        },
                        workPost: snapshot.data![index],
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
