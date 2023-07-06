import 'package:bookly/core/data/models/book_model/book_model.dart';

import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String q, String filter = '', String sort = ''}) async {
    try {
      var data = await ApiService.get(
        endPoint: 'volumes?',
        filter: filter,
        sorting: sort,
        subject: q,
        q: q,
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
