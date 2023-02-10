import 'package:equatable/equatable.dart';
import 'package:interpretasi/src/domain/entities/article_detail.dart';

class ArticleDetailModel extends Equatable {
  const ArticleDetailModel({
    required this.categoryId,
    required this.comments,
    required this.likes,
    required this.viewers,
    required this.content,
    required this.originalContent,
    required this.image,
    required this.title,
    required this.url,
    required this.tags,
    required this.createdAt,
    required this.author,
  });

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) {
    return ArticleDetailModel(
      categoryId: json['category_id'] as int,
      comments: json['comments'] as int,
      likes: json['likes'] as int,
      viewers: json['viewers'] as int,
      content: json['content'] as String,
      originalContent: json['original_content'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      tags: List<String>.from(
        (json['tags'] as Iterable<dynamic>).map((x) => x),
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      author: AuthorArticleModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final int categoryId;
  final int comments;
  final int likes;
  final int viewers;
  final String content;
  final String originalContent;
  final String image;
  final String title;
  final String url;
  final List<String> tags;
  final DateTime createdAt;
  final AuthorArticleModel author;

  ArticleDetail toEntity() {
    return ArticleDetail(
      url: url,
      title: title,
      content: content,
      image: image,
      viewers: viewers,
      comments: comments,
      likes: likes,
      categoryId: categoryId,
      tags: tags,
      originalContent: originalContent,
      createdAt: createdAt,
      author: author.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
        categoryId,
        comments,
        likes,
        viewers,
        content,
        originalContent,
        image,
        title,
        url,
        tags,
        createdAt,
        author,
      ];
}

class AuthorArticleModel extends Equatable {
  const AuthorArticleModel({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory AuthorArticleModel.fromJson(Map<String, dynamic> json) {
    return AuthorArticleModel(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );
  }
  AuthorArticle toEntity() {
    return AuthorArticle(id: id, name: name, photo: photo);
  }

  final int id;
  final String name;
  final String photo;

  @override
  List<Object?> get props => [id, name, photo];
}
