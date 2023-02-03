import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/user.dart';
import 'package:interpretasi/src/domain/repositories/user_repository.dart';

class GetUserProfile {
  GetUserProfile(this.repository);
  
  final UserRepository repository;

  Future<Either<Failure, User>> execute() {
    return repository.getProfile();
  }
}
