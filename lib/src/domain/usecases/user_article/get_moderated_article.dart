import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/repositories/user_article_repository.dart';

@injectable
class GetModeratedArticle {
  GetModeratedArticle(this.repository);

  final UserArticleRepository repository;

  Future<Either<Failure, List<Article>>> execute(int page) {
    return repository.getMyModeratedArticle(page);
  }
}
