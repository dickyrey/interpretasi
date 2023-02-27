import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/auth_repository.dart';

@injectable
class SignInWithEmail {
  SignInWithEmail(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, void>> execute({
    required String email,
    required String password,
  }) {
    return repository.signInWithEmail(email: email, password: password);
  }
}
