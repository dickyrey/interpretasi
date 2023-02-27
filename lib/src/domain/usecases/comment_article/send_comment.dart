import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/comment_article_repository.dart';

@injectable
class SendComment {
  SendComment(this.repository);
  
  final CommentArticleRepository repository;

  Future<Either<Failure, void>> execute({required String id, required String comment}) {
    return repository.sendComment(id: id,comment: comment);
  }
}
