import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/data/datasources/like_article_data_source.dart';
import 'package:interpretasi/src/domain/repositories/like_article_repository.dart';

@Injectable(as: LikeArticleRepository)
class LikeArticleRepositoryImpl extends LikeArticleRepository {
  LikeArticleRepositoryImpl(this.dataSource);

  final LikeArticleDataSource dataSource;
  @override
  Future<Either<Failure, bool>> checkStatus(String id) async {
    try {
      final result = await dataSource.checkStatus(id);
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
  Future<Either<Failure, bool>> likeOrUnlikedArticle(String id) async {
    try {
      final result = await dataSource.likeOrUnlikedArticle(id);
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
