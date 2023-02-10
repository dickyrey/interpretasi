import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/author.dart';

abstract class AuthorRepository {
  Future<Either<Failure, Author>> getAuthor(int id);
  Future<Either<Failure, bool>> reportAuthor({
    required int id,
    required String reason,
  });
}
