import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/user_repository.dart';

@injectable
class UpdateUserProfile {
  UpdateUserProfile(this.repository);

  final UserRepository repository;

  Future<Either<Failure, bool>> execute({
    required String name,
    required String bio,
    required File? imageFile,
  }) {
    return repository.changeProfile(
      name: name,
      bio: bio,
      imageFile: imageFile,
    );
  }
}
