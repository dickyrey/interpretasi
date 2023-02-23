import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article.dart';

abstract class UserArticleRepository {
  Future<Either<Failure, List<Article>>> getMyBannedArticle(int page);
  Future<Either<Failure, List<Article>>> getMyDraftedArticle(int page);
  Future<Either<Failure, List<Article>>> getMyModeratedArticle(int page);
  Future<Either<Failure, List<Article>>> getMyPublishedArticle(int page);
  Future<Either<Failure, List<Article>>> getMyRejectedArticle(int page);
  Future<Either<Failure, List<Article>>> readHistory();
  Future<Either<Failure, bool>> changeToModerated(String id);
}
