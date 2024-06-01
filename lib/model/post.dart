import 'package:homeless/api/api.dart';
import 'package:homeless/model/tag.dart';

class Post {
  final String userId;
  final String id;
  final String title;
  final String? subTitle;
  final String startDate;
  final String endDate;
  final String? description;
  final List<String>? images;
  final List<TagModel> tags;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.subTitle,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.images,
    required this.tags,
  });

  factory Post.fromJson(JSON json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      subTitle: json['subTitle'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
      images: json['images'],
      tags: json['tags'],
    );
  }
}
