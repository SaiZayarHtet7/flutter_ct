import 'package:injectable/injectable.dart';
import '../core.dart';

abstract class IConfig {
  String get baseUrl;

  Map<String, String> get headers;
}

@Injectable(as: IConfig)
class AppConfig extends IConfig {
  
  @override
  String get baseUrl => API_URL;

  @override
  Map<String, String> get headers => {};
}
