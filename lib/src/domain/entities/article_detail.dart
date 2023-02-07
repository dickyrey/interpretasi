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
      ];
}
