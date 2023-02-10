import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/data/datasources/author_data_source.dart';
import 'package:interpretasi/src/domain/entities/author.dart';
import 'package:interpretasi/src/domain/repositories/author_data_source.dart';

class AuthorRepositoryImpl extends AuthorRepository {
  AuthorRepositoryImpl(this.dataSource);

  final AuthorDataSource dataSource;
  @override
  Future<Either<Failure, Author>> getAuthor(int id) async {
    try {
      final result = await dataSource.getAuthor(id);
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
  Future<Either<Failure, bool>> reportAuthor({
    required int id,
    required String reason,
  }) async {
    try {
      final result = await dataSource.reportAuthor(id: id, reason: reason);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }
}
