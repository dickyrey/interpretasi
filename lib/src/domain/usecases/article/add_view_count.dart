import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';

@injectable
class AddViewCount {
  AddViewCount(this.repository);
  final ArticleRepository repository;

  Future<Either<Failure, void>> execute(String id) {
    return repository.addViewCount(id);
  }
}
