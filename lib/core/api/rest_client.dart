
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../utils/utils.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: API_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

}

