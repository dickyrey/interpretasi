import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/data/datasources/boarding_data_source.dart';
import 'package:interpretasi/src/domain/entities/boarding.dart';
import 'package:interpretasi/src/domain/repositories/boarding_repository.dart';

@Injectable(as: BoardingRepository)
class BoardingRepositoryImpl extends BoardingRepository {
  BoardingRepositoryImpl(this.dataSource);

  final BoardingDataSource dataSource;

  @override
  Future<Either<Failure, List<Boarding>>> getBoardingList() async {
    try {
      final result = await dataSource.getBoardingList();
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
