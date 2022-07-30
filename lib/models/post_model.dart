// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

import 'package:untitled/models/user_model.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.id,
    this.content,
    this.imageUrl,
    this.createAt,
    this.likes,
    this.user,
  });

  String? id;
  String? content;
  String? imageUrl;
  String? createAt;
  List<String>? likes;
  UserModel? user;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    content: json["content"],
    imageUrl: json["imageUrl"],
    createAt: json["createAt"],
    likes: List<String>.from(json["likes"].map((x) => x)),
    user: UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "imageUrl": imageUrl,
    "createAt": createAt,
    "likes": List<dynamic>.from(likes!.map((x) => x)),
    "user": user!.toJson(),
  };
}