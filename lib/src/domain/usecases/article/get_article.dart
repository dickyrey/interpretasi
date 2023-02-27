import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';

@injectable
class GetArticle {
  GetArticle(this.repository);

  final ArticleRepository repository;

  Future<Either<Failure, List<Article>>> execute({
    required int page,
    required String query,
    required String category,
    required bool isTrending,
    required OrderBy orderBy,
  }) {
    return repository.getArticle(
      page: page,
      query: query,
      category: category,
      isTrending: isTrending,
      orderby: orderBy,
    );
  }
}
