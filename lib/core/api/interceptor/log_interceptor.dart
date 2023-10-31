import 'package:dio/dio.dart';
import 'package:mason/mason.dart';

class LogInterceptor extends Interceptor {
  var logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.info(handler.toString());

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.info(handler.toString());
    super.onResponse(response, handler);
  }
}
