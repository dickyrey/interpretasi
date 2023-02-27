import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/like_article_repository.dart';

@injectable
class CheckLikeStatus {
  CheckLikeStatus(this.repository);
  
  final LikeArticleRepository repository;

  Future<Either<Failure, bool>> execute(String id) {
    return repository.checkStatus(id);
  }
}
