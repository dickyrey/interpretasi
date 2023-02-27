import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';

@injectable
class ReportArticle {
  ReportArticle(this.repository);

  final ArticleRepository repository;

  Future<Either<Failure, bool>> execute({
    required String id,
    required String reason,
  }) {
    return repository.reportArticle(id: id, reason: reason);
  }
}
