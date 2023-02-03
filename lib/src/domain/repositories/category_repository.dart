import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/category.dart';

// ignore: one_member_abstracts
abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
