import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/data/datasources/user_article_data_source.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/repositories/user_article_repository.dart';

class UserArticleRepositoryImpl extends UserArticleRepository {
  UserArticleRepositoryImpl(this.dataSource);

  final UserArticleDataSource dataSource;
  @override
  Future<Either<Failure, List<Article>>> getMyBannedArticle(int page) async {
    try {
      final result = await dataSource.getMyBannedArticle(page);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getMyDraftedArticle(int page) async {
    try {
      final result = await dataSource.getMyDraftedArticle(page);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getMyModeratedArticle(int page) async {
    try {
      final result = await dataSource.getMyModeratedArticle(page);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getMyPublishedArticle(int page) async {
    try {
      final result = await dataSource.getMyPublishedArticle(page);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getMyRejectedArticle(int page) async {
    try {
      final result = await dataSource.getMyRejectedArticle(page);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }

  @override
  Future<Either<Failure, List<Article>>> readHistory() async {
    try {
      final result = await dataSource.readHistory();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> changeToModerated(String id) async {
    try {
      final result = await dataSource.changeToModerated(id);
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
