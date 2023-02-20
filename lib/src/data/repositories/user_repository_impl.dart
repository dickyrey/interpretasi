import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/data/datasources/user_data_source.dart';
import 'package:interpretasi/src/domain/entities/user.dart';
import 'package:interpretasi/src/domain/entities/verification_status.dart';
import 'package:interpretasi/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;
  
  @override
  Future<Either<Failure, VerificationStatus>> checkUserVerification() async {
    try {
      final result = await dataSource.checkUserVerification();
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> changeProfile({
    required String name,
    required String bio,
    required File? imageFile,
  }) async {
    try {
      final result = await dataSource.changeProfile(
        name: name,
        bio: bio,
        imageFile: imageFile,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }

  @override
  Future<Either<Failure, User>> getProfile() async {
    try {
      final result = await dataSource.getProfile();
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }
}
