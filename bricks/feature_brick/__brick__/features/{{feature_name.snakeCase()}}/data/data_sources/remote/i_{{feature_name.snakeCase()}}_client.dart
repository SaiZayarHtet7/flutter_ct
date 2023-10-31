import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ct/core/core.dart';

import '../../../{{feature_name.snakeCase()}}.dart';

@Injectable(as: {{feature_name.pascalCase()}}Client)
class I{{feature_name.pascalCase()}}Client extends  {{feature_name.pascalCase()}}Client {
  final Dio dio;
  final IConfig config;
  final RestClient client;

   I{{feature_name.pascalCase()}}Client({
    required this.dio,
    required this.config,
  }) : client = RestClient(dio, baseUrl: config.baseUrl);
}
