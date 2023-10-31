import 'config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'error_handle.dart';
import 'interceptor/token_interceptor.dart';

@module
abstract class DioProvider {
  @singleton
  Dio dio(IConfig config) {
    Dio dio = Dio();
    dio.options.headers = config.headers;
    dio.interceptors.addAll({
      // DioCacheInterceptor(options: cacheOptions),
      TokenInterceptor(dio),
      // LogInterceptor(),
      ErrorHandle(dio),
    });
    return dio;
  }
}
