import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getProfile();
  Future<Either<Failure, bool>> changeProfile({
    required String name,
    required File? imageFile,
  });
}
