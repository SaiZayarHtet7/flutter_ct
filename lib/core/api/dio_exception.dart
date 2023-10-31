// import 'package:dio/dio.dart';

// class DioExceptions implements Exception {
//   String message = "";

//   DioExceptions.fromDioError(DioErrorType dioError) {
//     switch (dioError) {
//       case DioErrorType.cancel:
//       case DioErrorType.connectionError:
//         message = "Request to API server was cancelled!";
//         break;
//       case DioErrorType.connectionTimeout:
//         message = "Connection timeout with API server!";
//         break;
//       case DioErrorType.sendTimeout:
//         message = "No Internet Connections!";
//         break;
//       case DioErrorType.receiveTimeout:
//         message = "Timeout in connection with API server!";
//         break;
//       case DioErrorType.badCertificate:
//         message = "bad certificate ";
//         break;
//       case DioErrorType.badResponse:
//         message = "Bad response";
//         break;

//       case DioErrorType.unknown:
//         message = "Something went wrong ";
//         break;
//     }
//   }

//   String _handleError(int statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return 'Bad request';
//       case 404:
//         return error["message"];
//       case 500:
//         return "Internal Server Error";
//       default:
//         return 'Oops something went wroung!';
//     }
//   }

//   @override
//   String toString() => message;
// }
