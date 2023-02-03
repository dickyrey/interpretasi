import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/verification_status.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, bool>> checkGoogleAuth();
  Future<Either<Failure, bool>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, bool>> signUpWithEmail(String email);
  Future<Either<Failure, VerificationStatus>> checkUserVerification();
  Future<Either<Failure, bool>> resendEmailVerification();
}
