// Here, this is abstract as in thic class I will determine what will happen, but without determining how that will happen.
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fetchFeauredBooks();
  Future<List<BookEntity>> fetchNewewstBooks();
}
