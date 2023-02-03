import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/auth_repository.dart';

class ResendEmailVerification {
  ResendEmailVerification(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, bool>> execute() {
    return repository.resendEmailVerification();
  }
}
