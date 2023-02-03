import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';

class GetLatestArticle {

  GetLatestArticle(this.repository);
  
  final ArticleRepository repository;

  Future<Either<Failure, List<Article>>> execute() {
    return repository.getLatestArticle();
  }
}
