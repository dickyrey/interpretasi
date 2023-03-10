import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/entities/article_detail.dart';

abstract class ArticleRepository {
  Future<Either<Failure, bool>>  addViewCount(String id);
  Future<Either<Failure, List<Article>>> getArticle({
    required int page,
    required String query,
    required String category,
    required bool isTrending,
    required OrderBy orderby,
  });
  Future<Either<Failure, ArticleDetail>> getArticleDetail(String id);
  Future<Either<Failure, List<Article>>> searchArticle(String query);
  Future<Either<Failure, bool>> deleteArticle(String id);
  Future<Either<Failure, bool>> createArticle({
    required int categoryId,
    required File image,
    required String title,
    required String content,
    required String deltaJson,
    required List<String> tags,
  });
  Future<Either<Failure, bool>> updateArticle({
    required int categoryId,
    required File? image,
    required String id,
    required String title,
    required String content,
    required String deltaJson,
    required List<String> tags,
  });
  Future<Either<Failure, bool>> reportArticle({
    required String id,
    required String reason,
  });
  Future<Either<Failure, String>>uploadImage(File image);
}
