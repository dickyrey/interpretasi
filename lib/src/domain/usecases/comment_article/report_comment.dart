import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/comment_article_repository.dart';

@injectable
class ReportComment {
  ReportComment(this.repository);

  final CommentArticleRepository repository;

  Future<Either<Failure, void>> execute({
    required String articleId,
    required int commentId,
    required String reason,
  }) {
    return repository.reportComment(
      articleId: articleId,
      commentId: commentId,
      reason: reason,
    );
  }
}
