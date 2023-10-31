import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import '../../data/models/user_model.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;

  TokenInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Accept"] = Headers.jsonContentType;
    options.contentType = Headers.formUrlEncodedContentType;

    

    options.connectTimeout = const Duration(seconds: 20);
    options.receiveTimeout = const Duration(seconds: 20);
    options.sendTimeout = const Duration(seconds: 20);
    
    return handler.next(options);
  }
}
