import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';

abstract class LikeArticleRepository {
  Future<Either<Failure, bool>> checkStatus(String id);
  Future<Either<Failure, bool>> likeOrUnlikedArticle(String id);
}
