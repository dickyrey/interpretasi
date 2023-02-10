import 'package:equatable/equatable.dart';

class ArticleDetail extends Equatable {
  const ArticleDetail({
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
  final AuthorArticle author;

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

class AuthorArticle extends Equatable {
  const AuthorArticle({
    required this.id,
    required this.name,
    required this.photo,
  });

  final int id;
  final String name;
  final String photo;

  @override
  List<Object?> get props => [id, name, photo];
}
