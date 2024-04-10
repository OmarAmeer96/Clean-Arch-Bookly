import 'package:bookly_app/Core/errors/failure.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_sourse.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// This class is the implementation of the home repo, so it implements the unimplemented methods of the home repo.
class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeauredBooks({int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeauredBooks();
      if (books.isNotEmpty) {
        // Once the method returns anything, it will terminate.
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeauredBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewewstBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewewstBooks();
      if (books.isNotEmpty) {
        // Once the method returns anything, it will terminate.
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewewstBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
