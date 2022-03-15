import 'dart:convert';

import 'author.dart';

CornerPost cornerPostFromMap(String str) => CornerPost.fromMap(json.decode(str));

String cornerPostToMap(CornerPost data) => json.encode(data.toMap());

class CornerPost {

  static List<CornerPost> allCornerPosts = [];

  CornerPost({
    required this.id,
    required this.adminid,
    required this.adminimage,
    required this.title,
    required this.newshit,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.publshedAt,
    required this.content,
    required this.articleUrl,
  }){
    postAuthor = Author(name: this.author, photoURL: this.adminimage, id: adminid, post: CornerPost._internal(id: id, adminid: adminid, adminimage: adminimage, title: title, newshit: newshit, author: author, description: description, urlToImage: urlToImage, publshedAt: publshedAt, content: content, articleUrl: articleUrl));
    allCornerPosts.add(CornerPost._internal(id: id, adminid: adminid, adminimage: adminimage, title: title, newshit: newshit, author: author, description: description, urlToImage: urlToImage, publshedAt: publshedAt, content: content, articleUrl: articleUrl));
  }

  CornerPost._internal({
    required this.id,
    required this.adminid,
    required this.adminimage,
    required this.title,
    required this.newshit,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.publshedAt,
    required this.content,
    required this.articleUrl,
  });



  final String id;
  final String adminid;
  final String adminimage;
  final String title;
  final String newshit;
  final String author;
  final String description;
  final String urlToImage;
  final DateTime publshedAt;
  final String content;
  final String articleUrl;
  late final Author postAuthor;

  CornerPost copyWith({
    String? id,
    String? adminid,
    String? adminimage,
    String? title,
    String? newshit,
    String? author,
    String? description,
    String? urlToImage,
    DateTime? publshedAt,
    String? content,
    String? articleUrl,
  }) =>
      CornerPost(
        id: id ?? this.id,
        adminid: adminid ?? this.adminid,
        adminimage: adminimage ?? this.adminimage,
        title: title ?? this.title,
        newshit: newshit ?? this.newshit,
        author: author ?? this.author,
        description: description ?? this.description,
        urlToImage: urlToImage ?? this.urlToImage,
        publshedAt: publshedAt ?? this.publshedAt,
        content: content ?? this.content,
        articleUrl: articleUrl ?? this.articleUrl,
      );

  factory CornerPost.fromMap(Map<String, dynamic> json) => CornerPost(
    id: json["id"],
    adminid: json["adminid"],
    adminimage: json["adminimage"],
    title: json["title"],
    newshit: json["newshit"],
    author: json["\u0024author"],
    description: json["description"],
    urlToImage: json["urlToImage"],
    publshedAt: DateTime.parse(json["publshedAt"]),
    content: json["content"],
    articleUrl: json["articleUrl"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "adminid": adminid,
    "adminimage": adminimage,
    "title": title,
    "newshit": newshit,
    "\u0024author": author,
    "description": description,
    "urlToImage": urlToImage,
    "publshedAt": publshedAt.toIso8601String(),
    "content": content,
    "articleUrl": articleUrl,
  };
}
