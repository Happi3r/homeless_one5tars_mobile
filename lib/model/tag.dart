import 'json.dart';

class TagModel {
  final String id;
  final String name;
  final String? image;

  const TagModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory TagModel.fromJson(JSON json) {
    return TagModel(id: json['id'], name: json['name'], image: json['image'],);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": "$id",
      "name": "$name",
      "image": "$image",
    };
  }
}