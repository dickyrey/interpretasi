import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/password_repository.dart';

class ChangePassword {
  ChangePassword(this.repository);

  final PasswordRepository repository;

  Future<Either<Failure, bool>> execute({
    required String oldPassword,
    required String newPassword,
  }) {
    return repository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
