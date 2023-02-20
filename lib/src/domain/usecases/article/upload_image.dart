import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';

class UploadImage {
  UploadImage(this.repository);
  final ArticleRepository repository;

  Future<Either<Failure, String>> execute(File image) {
    return repository.uploadImage(image);
  }
}
