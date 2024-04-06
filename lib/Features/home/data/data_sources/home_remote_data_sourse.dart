/* Here, this is abstract as in thic class I will determine what will happen in the remote data source, 
but without determining how that will happen.
Also, I will not use the either type here; as I don't need to handle the exceptions here.
*/
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeauredBooks();
  Future<List<BookEntity>> fetchNewewstBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeauredBooks() {
    // TODO: implement fetchFeauredBooks
    throw UnimplementedError();
  }
  
  @override
  Future<List<BookEntity>> fetchNewewstBooks() {
    // TODO: implement fetchNewewstBooks
    throw UnimplementedError();
  }
}
