import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void cacheBooksDataAfterFetchingItFromApi(
    List<BookEntity> books, String boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}
