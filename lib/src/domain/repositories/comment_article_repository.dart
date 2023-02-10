import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/comment.dart';

abstract class CommentArticleRepository {
  Future<Either<Failure, List<Comment>>> getCommentList(String id);
  Future<Either<Failure, bool>> sendComment({
    required String id,
    required String comment,
  });
  Future<Either<Failure, bool>> deleteComment({
    required String id,
    required int userId,
  });
  Future<Either<Failure, bool>> reportComment({
    required String articleId,
    required int commentId,
    required String reason,
  });
}
