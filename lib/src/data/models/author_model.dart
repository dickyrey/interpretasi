import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:interpretasi/src/data/models/article_model.dart';
import 'package:interpretasi/src/domain/entities/author.dart';

class AuthorModel extends Equatable {
  const AuthorModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.email,
    required this.articleList,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
      email: json['email'] as String,
      articleList: List<ArticleModel>.from(
        (json['articles'] as Iterable<dynamic>).map(
          (e) => ArticleModel.fromJson(
            e as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }

  final int id;
  final String name;
  final String photo;
  final String email;
  final List<ArticleModel> articleList;

  Author toEntity() {
    return Author(
      id: id,
      name: name,
      photo: photo,
      email: email,
      articleList: articleList.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        photo,
        email,
        articleList,
      ];
}

List<AuthorModel> authorModelFromJson(String str) {
  return List<AuthorModel>.from(
    (json.decode(str) as Iterable<dynamic>)
        .map((x) => AuthorModel.fromJson(x as Map<String, dynamic>)),
  );
}
