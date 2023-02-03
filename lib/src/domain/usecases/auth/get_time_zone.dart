import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/auth_repository.dart';

class GetTimeZone {
  GetTimeZone(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, List<String>>> execute() {
    return repository.getTimeZone();
  }
}
