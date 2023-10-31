import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ct/core/core.dart';

import '../../../todo.dart';

@Injectable(as: TodoClient)
class ITodoClient extends  TodoClient {
  final Dio dio;
  final IConfig config;
  final RestClient client;

   ITodoClient({
    required this.dio,
    required this.config,
  }) : client = RestClient(dio, baseUrl: config.baseUrl);
}
