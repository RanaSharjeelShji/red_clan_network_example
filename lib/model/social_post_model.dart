import 'package:meta/meta.dart';
import 'dart:convert';

class SocialPostModel {
    int userId;
    int id;
    String title;
    String body;

    SocialPostModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    SocialPostModel copyWith({
        int? userId,
        int? id,
        String? title,
        String? body,
    }) => 
        SocialPostModel(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            body: body ?? this.body,
        );

    factory SocialPostModel.fromRawJson(String str) => SocialPostModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SocialPostModel.fromJson(Map<String, dynamic> json) => SocialPostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
