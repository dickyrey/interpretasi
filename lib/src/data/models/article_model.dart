import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:interpretasi/src/domain/entities/article.dart';

class ArticleModel extends Equatable {
  const ArticleModel({
    required this.comments,
    required this.likes,
    required this.viewers,
    required this.image,
    required this.title,
    required this.url,
    required this.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      comments: json['comments'] as int,
      likes: json['likes'] as int,
      viewers: json['viewers'] as int,
      image: json['image'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  final int comments;
  final int likes;
  final int viewers;
  final String image;
  final String title;
  final String url;
  final DateTime createdAt;

  Article toEntity() {
    return Article(
      comments: comments,
      likes: likes,
      viewers: viewers,
      image: image,
      title: title,
      url: url,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [
        comments,
        likes,
        viewers,
        image,
        title,
        url,
        createdAt,
      ];
}

List<ArticleModel> articleModelFromJson(String str) {
  return List<ArticleModel>.from(
    (json.decode(str) as Iterable<dynamic>)
        .map((x) => ArticleModel.fromJson(x as Map<String, dynamic>)),
  );
}
