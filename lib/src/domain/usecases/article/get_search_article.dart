import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';

class GetSearchArticle {
  GetSearchArticle(this.repository);

  final ArticleRepository repository;

  Future<Either<Failure, List<Article>>> execute(String query) {
    return repository.searchArticle(query);
  }
}
