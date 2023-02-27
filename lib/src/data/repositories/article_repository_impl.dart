import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/data/datasources/article_data_source.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/entities/article_detail.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';

@Injectable(as: ArticleRepository)
class ArticleRepositoryImpl extends ArticleRepository {
  ArticleRepositoryImpl(this.dataSource);

  final ArticleDataSource dataSource;

  @override
  Future<Either<Failure, bool>> addViewCount(String id) async {
    try {
      final result = await dataSource.addViewCount(id);
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
  Future<Either<Failure, List<Article>>> getArticle({
    required int page,
    required String query,
    required String category,
    required bool isTrending,
    required OrderBy orderby,
  }) async {
    try {
      final result = await dataSource.getArticle(
        page: page,
        query: query,
        category: category,
        isTrending: isTrending,
        orderBy: orderby,
      );
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
  Future<Either<Failure, ArticleDetail>> getArticleDetail(String id) async {
    try {
      final result = await dataSource.getArticleDetail(id);
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
  Future<Either<Failure, List<Article>>> searchArticle(String query) async {
    try {
      final result = await dataSource.searchArticle(query);
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
  Future<Either<Failure, bool>> createArticle({
    required int categoryId,
    required File image,
    required String title,
    required String content,
    required String deltaJson,
    required List<String> tags,
  }) async {
    try {
      final result = await dataSource.createArticle(
        categoryId: categoryId,
        image: image,
        title: title,
        content: content,
        deltaJson: deltaJson,
        tags: tags,
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
  Future<Either<Failure, bool>> updateArticle({
    required int categoryId,
    required File? image,
    required String id,
    required String title,
    required String content,
    required String deltaJson,
    required List<String> tags,
  }) async {
    try {
      final result = await dataSource.updateArticle(
        categoryId: categoryId,
        image: image,
        id: id,
        title: title,
        content: content,
        deltaJson: deltaJson,
        tags: tags,
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
  Future<Either<Failure, bool>> deleteArticle(String id) async {
    try {
      final result = await dataSource.deleteArticle(id);
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
  Future<Either<Failure, bool>> reportArticle({
    required String id,
    required String reason,
  }) async {
    try {
      final result = await dataSource.reportArticle(id: id, reason: reason);
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
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      final result = await dataSource.uploadImage(image);
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
