import 'dart:js_interop';

import 'package:dio/dio.dart';

class ApiService {
  ApiService();
  static const String _baseUrl = "https://www.googleapis.com/books/v1/";
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    receiveDataWhenStatusError: true,
  ));

  static Future<Map<String, dynamic>> get({
    required String endPoint,
    String? filter,
    String? sorting,
    String subject = '',
    required String q,
  }) async {
    Map<String, dynamic>? query = {
      'q': q,
      if (!filter.isNull) 'filter': filter,
      if (!sorting.isNull) 'orderBy': sorting,
      'subject': subject,
    };
    var respons = await _dio.get(endPoint, queryParameters: query);
    return respons.data;
  }
}
