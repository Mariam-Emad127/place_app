import 'package:advanced_flutter/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out> {

Future<Either<Failure,Out>> excute(In input);

}