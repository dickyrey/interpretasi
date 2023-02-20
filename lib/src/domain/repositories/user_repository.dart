import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/user.dart';
import 'package:interpretasi/src/domain/entities/verification_status.dart';

abstract class UserRepository {
  Future<Either<Failure, VerificationStatus>> checkUserVerification();
  Future<Either<Failure, User>> getProfile();
  Future<Either<Failure, bool>> changeProfile({
    required String name,
    required String bio,
    required File? imageFile,
  });
}
