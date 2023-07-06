import 'package:bookly/core/data/models/book_model/book_model.dart';

import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/search_data_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required SearchData searchData}) async {
    try {
      print(searchData.filter);
      var data = await ApiService.get(
        endPoint: 'volumes?',
        filter: searchData.filter ?? '',
        sorting: searchData.sort ?? '',
        subject: searchData.q,
        q: searchData.q,
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
