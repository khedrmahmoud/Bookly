part of 'searched_books_cubit.dart';

abstract class SearchedBooksState extends Equatable {
  const SearchedBooksState();

  @override
  List<Object> get props => [];
}

class SearchedBooksInitial extends SearchedBooksState {}

class SearchedBooksLoading extends SearchedBooksState {}

class SearchedBooksSuccess extends SearchedBooksState {
  final List<BookModel> books;
  const SearchedBooksSuccess(this.books);
}

class SearchedBooksFailure extends SearchedBooksState {
  final String message;
  const SearchedBooksFailure(this.message);
}
