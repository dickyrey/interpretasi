import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.comments,
    required this.likes,
    required this.viewers,
    required this.image,
    required this.title,
    required this.url,
    required this.createdAt,
  });

  final int comments;
  final int likes;
  final int viewers;
  final String image;
  final String title;
  final String url;
  final DateTime createdAt;

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
