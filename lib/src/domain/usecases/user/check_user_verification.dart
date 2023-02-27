import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/verification_status.dart';
import 'package:interpretasi/src/domain/repositories/user_repository.dart';

@injectable
class CheckUserVerification {
  CheckUserVerification(this.repository);

  final UserRepository repository;

  Future<Either<Failure, VerificationStatus>> execute() {
    return repository.checkUserVerification();
  }
}
