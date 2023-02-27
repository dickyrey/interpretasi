import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/like_article_repository.dart';

@injectable
class LikeOrUnlikedArticle {
  LikeOrUnlikedArticle(this.repository);
  
  final LikeArticleRepository repository;

  Future<Either<Failure, void>> execute(String id) {
    return repository.likeOrUnlikedArticle(id);
  }
}
