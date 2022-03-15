import 'dart:convert';


News newsFromMap(String str) => News.fromMap(json.decode(str));

String newsToMap(News data) => json.encode(data.toMap());

class News {
  static List<News> allNews = [];

  News({
    required this.id,
    required this.title,
    required this.newshit,
    this.author,
    required this.description,
    required this.urlToImage,
    required this.publshedAt,
    required this.content,
    required this.articleUrl,
  }){
    allNews.add(News._internal(id, title, newshit, author, description, urlToImage, publshedAt, content, articleUrl));
  }

  News._internal(this.id, this.title, this.newshit, this.author, this.description, this.urlToImage, this.publshedAt, this.content, this.articleUrl);
  final String id;
  final String title;
  final String newshit;
  final String? author;
  final String description;
  final String urlToImage;
  final DateTime publshedAt;
  final String content;
  final String articleUrl;

  News copyWith({
    String? id,
    String? title,
    String? newshit,
    String? author,
    String? description,
    String? urlToImage,
    DateTime? publshedAt,
    String? content,
    String? articleUrl,
  }) =>
      News(
        id: id ?? this.id,
        title: title ?? this.title,
        newshit: newshit ?? this.newshit,
        author: author ?? this.author,
        description: description ?? this.description,
        urlToImage: urlToImage ?? this.urlToImage,
        publshedAt: publshedAt ?? this.publshedAt,
        content: content ?? this.content,
        articleUrl: articleUrl ?? this.articleUrl,
      );

  factory News.fromMap(Map<String, dynamic> json) => News(
    id: json["id"],
    title: json["title"],
    newshit: json["newshit"],
    author: json["\u0024author"] ?? '',
    description: json["description"],
    urlToImage: json["urlToImage"],
    publshedAt: DateTime.parse(json["publshedAt"]),
    content: json["content"],
    articleUrl: json["articleUrl"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "newshit": newshit,
    "\u0024author": author ?? '',
    "description": description,
    "urlToImage": urlToImage,
    "publshedAt": publshedAt.toIso8601String(),
    "content": content,
    "articleUrl": articleUrl,
  };
}
