import 'package:dio/dio.dart';

class ApiService {
  ApiService();
  static String _baseUrl = "https://www.googleapis.com/books/v1/";
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    receiveDataWhenStatusError: true,
  ));

  static Future<Map<String, dynamic>> get({
    required String endPoint,
    String filter = '',
    String sorting = '',
    String subject = '',
    String q = '',
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Filtering': filter,
      'Sorting': sorting,
      'subject': subject,
      'q': q
    };
    var respons = await _dio.get(endPoint);
    return respons.data;
  }
}
