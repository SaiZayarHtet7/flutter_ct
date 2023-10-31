import 'package:dio/dio.dart';

class NoTokenInterceptor extends Interceptor {
  final Dio dio;

  NoTokenInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // var accessToken = await TokenRepository().getAccessToken();

    // final String cachedLanguageCode =
    //     await LanguageCacheHelper().getCachedLanguageCode();

    // options.headers["Accept"] = Headers.jsonContentType;
    // options.contentType = Headers.formUrlEncodedContentType;

    // if (options.uri.toString().endsWith("setting") ||
    //     options.uri.toString().endsWith("faq")) {
    //   options.headers['Accept-Language'] =
    //       cachedLanguageCode == "my" ? "mm" : cachedLanguageCode;
    // }

    options.connectTimeout = const Duration(seconds: 20);
    options.receiveTimeout = const Duration(seconds: 20);
    options.sendTimeout = const Duration(seconds: 20);

    return handler.next(options);
  }
}
