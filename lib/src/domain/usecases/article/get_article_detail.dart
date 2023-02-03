import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article_detail.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';

class GetArticleDetail {
  GetArticleDetail(this.repository);
  
  final ArticleRepository repository;

  Future<Either<Failure, ArticleDetail>> execute(String id) {
    return repository.getArticleDetail(id);
  }
}
