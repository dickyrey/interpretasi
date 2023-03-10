import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/data/datasources/category_data_source.dart';
import 'package:interpretasi/src/domain/entities/category.dart';
import 'package:interpretasi/src/domain/repositories/category_repository.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl extends CategoryRepository {
  CategoryRepositoryImpl(this.dataSource);

  final CategoryDataSource dataSource;

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final result = await dataSource.getCategories();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(ExceptionMessage.internetNotConnected),
      );
    }
  }
}
