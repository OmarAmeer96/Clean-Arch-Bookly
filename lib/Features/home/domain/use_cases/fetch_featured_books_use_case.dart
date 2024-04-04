// The use cases are used to fetch data from the repository, so it should have an access to the repo.
import 'package:bookly_app/Core/errors/failure.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  Future<Either<Failure, List<BookEntity>>> fetchFeauredBooks() {
    /* 
    Here, for example if i will check the permissions, so the code will be written here, 
    and the functionality of fetching the featured books itself 
    is at the fetchFeauredBooks (so that i just called it in the next line). 
    */
    return homeRepo.fetchFeauredBooks();
  }
}
