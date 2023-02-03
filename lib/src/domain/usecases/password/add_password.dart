import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/password_repository.dart';

class AddPassword {
  AddPassword(this.repository);
  
  final PasswordRepository repository;

  Future<Either<Failure, bool>> execute(String password) {
    return repository.addPassword(password);
  }
}
