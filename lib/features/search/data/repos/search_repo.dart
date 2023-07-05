import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String q, String filter, String sort});
}
