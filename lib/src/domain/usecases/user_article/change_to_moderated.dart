import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/user_article_repository.dart';

@injectable
class ChangeToModerated {
  ChangeToModerated(this.repository);

  final UserArticleRepository repository;

  Future<Either<Failure, bool>> execute(String id) {
    return repository.changeToModerated(id);
  }
}
