import 'package:dartz/dartz.dart';
import 'package:interpretasi/src/common/failure.dart';
import 'package:interpretasi/src/domain/entities/boarding.dart';

// ignore: one_member_abstracts
abstract class BoardingRepository {
  Future<Either<Failure, List<Boarding>>> getBoardingList();
}
