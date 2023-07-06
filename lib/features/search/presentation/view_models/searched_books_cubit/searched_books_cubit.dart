import 'package:bookly/core/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/search_data_model.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this._searchRepo) : super(SearchedBooksInitial());

  final SearchRepo _searchRepo;

  SearchData searchData = SearchData(q: '');

  Future<void> searchAboutBook() async {
    emit(SearchedBooksLoading());
    var result = await _searchRepo.fetchSearchedBooks(searchData: searchData);
    result.fold((failure) => emit(SearchedBooksFailure(failure.errorMessage)),
        (books) {
      emit(SearchedBooksSuccess(books));
    });
  }
}
