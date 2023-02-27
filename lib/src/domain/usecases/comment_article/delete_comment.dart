import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/comment_article_repository.dart';

@injectable
class DeleteComment {
  DeleteComment(this.repository);
  
  final CommentArticleRepository repository;

  Future<Either<Failure, void>> execute({required String id, required int userId}) {
    return repository.deleteComment(id: id,userId: userId);
  }
}
