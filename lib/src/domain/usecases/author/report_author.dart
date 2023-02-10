import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/author_data_source.dart';

class ReportAuthor {
  ReportAuthor(this.repository);

  final AuthorRepository repository;

  Future<Either<Failure, bool>> execute({
    required int id,
    required String reason,
  }) {
    return repository.reportAuthor(id: id, reason: reason);
  }
}
