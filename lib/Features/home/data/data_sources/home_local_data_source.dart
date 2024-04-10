import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeauredBooks({int pageNumber = 0});
  List<BookEntity> fetchNewewstBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeauredBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int startIndex = pageNumber;
    int endIndex =
        (pageNumber + 1) * 10; // The endIndex isn't included in the sublist.
    int listLength = box.values.length;
    if (startIndex >= listLength || endIndex > listLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewewstBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
