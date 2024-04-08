/* Here, this is abstract as in thic class I will determine what will happen in the remote data source, 
but without determining how that will happen.
Also, I will not use the either type here; as I don't need to handle the exceptions here.
*/
import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Core/utils/functions/cache_books_data_after_fetching_it_from_api.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constants.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeauredBooks();
  Future<List<BookEntity>> fetchNewewstBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeauredBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = getBooksList(data);
    cacheBooksDataAfterFetchingItFromApi(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewewstBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=newewst&q=programming',
    );
    List<BookEntity> books = getBooksList(data);
    cacheBooksDataAfterFetchingItFromApi(books, kNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
