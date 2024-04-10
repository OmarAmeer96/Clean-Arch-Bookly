// Here, this is abstract as in thic class I will determine what will happen, but without determining how that will happen.
import 'package:bookly_app/Core/errors/failure.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeauredBooks({
    int pageNumber = 0,
  });
  Future<Either<Failure, List<BookEntity>>> fetchNewewstBooks();
}
