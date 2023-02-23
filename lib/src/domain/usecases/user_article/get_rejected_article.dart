import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/repositories/user_article_repository.dart';

class GetRejectedArticle {
  GetRejectedArticle(this.repository);

  final UserArticleRepository repository;

  Future<Either<Failure, List<Article>>> execute(int page) {
    return repository.getMyRejectedArticle(page);
  }
}
