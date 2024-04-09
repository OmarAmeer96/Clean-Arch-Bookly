import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newewst_books_state.dart';

class NewewstBooksCubit extends Cubit<NewewstBooksState> {
  NewewstBooksCubit(this.fetchNewestBooksUseCase)
      : super(NewewstBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future fetchNewestBooks() async {
    emit(NewewstBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) => emit(NewewstBooksFailure(failure.message)),
      (books) => emit(NewewstBooksSuccess(books)),
    );
  }
}
