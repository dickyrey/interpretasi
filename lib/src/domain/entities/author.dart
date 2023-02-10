import 'package:equatable/equatable.dart';
import 'package:interpretasi/src/domain/entities/article.dart';

class Author extends Equatable {
  const Author({
    required this.id,
    required this.name,
    required this.photo,
    required this.email,
    required this.articleList,
  });

  final int id;
  final String name;
  final String photo;
  final String email;
  final List<Article> articleList;
  
  @override
  List<Object?> get props => [
        id,
        name,
        photo,
        email,
        articleList,
      ];
}
