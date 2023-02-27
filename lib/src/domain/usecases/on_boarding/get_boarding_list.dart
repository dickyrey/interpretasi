import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/boarding.dart';
import 'package:interpretasi/src/domain/repositories/boarding_repository.dart';

@injectable
class GetBoardingList {
  GetBoardingList(this.repository);

  final BoardingRepository repository;

  Future<Either<Failure, List<Boarding>>> execute() {
    return repository.getBoardingList();
  }
}
