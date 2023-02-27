import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/author.dart';
import 'package:interpretasi/src/domain/repositories/author_data_source.dart';

@injectable
class GetAuthor {
  GetAuthor(this.repository);

  final AuthorRepository repository;

  Future<Either<Failure, Author>> execute(int id) {
    return repository.getAuthor(id);
  }
}
