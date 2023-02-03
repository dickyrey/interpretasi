import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/entities/article_detail.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getLatestArticle();
  Future<Either<Failure, ArticleDetail>> getArticleDetail(String id);
  Future<Either<Failure, bool>> deleteArticle(String id);
  Future<Either<Failure, bool>> createArticle({
    required String title,
    required String content,
    required File image,
    required List<String> categories,
  });
  Future<Either<Failure, bool>> updateArticle({
    required String id,
    required String title,
    required String content,
    required File? imageFile,
    required List<String> categories,
  });
}
