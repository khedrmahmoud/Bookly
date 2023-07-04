import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiService");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiService");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiService");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiService was canceled");
      case DioExceptionType.unknown:
        return ServerFailure("An unknown error occurred");
      case DioExceptionType.connectionError:
        return ServerFailure("There was a connection error");
      case DioExceptionType.badCertificate:
        return ServerFailure("The server's certificate is invalid");
      default:
        return ServerFailure('Opps There was an error, Please try again later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please try again later');
    } else {
      return ServerFailure('Opps There was an error, Please try again later');
    }
  }
}
