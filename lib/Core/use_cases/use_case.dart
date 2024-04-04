import 'package:bookly_app/Core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

// This class is used to indecate that I willn't pass any param to the use case.
class NoParam {}
