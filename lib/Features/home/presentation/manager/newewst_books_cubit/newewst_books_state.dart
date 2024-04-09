part of 'newewst_books_cubit.dart';

@immutable
sealed class NewewstBooksState {}

final class NewewstBooksInitial extends NewewstBooksState {}

final class NewewstBooksLoading extends NewewstBooksState {}

final class NewewstBooksFailure extends NewewstBooksState {
  final String errMessage;

  NewewstBooksFailure(this.errMessage);
}

final class NewewstBooksSuccess extends NewewstBooksState {
  final List<BookEntity> books;

  NewewstBooksSuccess(this.books);
}
