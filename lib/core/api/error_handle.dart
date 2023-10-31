import 'package:dio/dio.dart';
class ErrorHandle extends Interceptor {
  final Dio dio;

  ErrorHandle(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.sendTimeout:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badCertificate:
        throw InternalServerErrorException(err.requestOptions);
      case DioExceptionType.cancel:
        throw InternalServerErrorException(err.requestOptions);
      case DioExceptionType.receiveTimeout:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.connectionTimeout:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;

      case DioExceptionType.unknown:
        throw InternalServerErrorException(err.requestOptions);

      case DioExceptionType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No Internet Connection Please Try Again';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Connection time out!';
  }
}

bool checkConnectionFailure(DioException error) {
  return error.type == DioExceptionType.connectionError ||
      error.type == DioExceptionType.connectionTimeout ||
      error.type == DioExceptionType.receiveTimeout ||
      error.type == DioExceptionType.sendTimeout ||
      error.type == DioExceptionType.unknown;
}
