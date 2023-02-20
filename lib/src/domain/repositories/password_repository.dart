import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';

abstract class PasswordRepository {
  Future<Either<Failure, bool>> addPassword(String password);
  Future<Either<Failure, bool>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<Failure, bool>> forgotPassword(String email);
}
