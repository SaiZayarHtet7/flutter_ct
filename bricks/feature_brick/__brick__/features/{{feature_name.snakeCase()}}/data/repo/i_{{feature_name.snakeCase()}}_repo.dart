import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

@Injectable(as: {{feature_name.pascalCase()}}Repo)
class I{{feature_name.pascalCase()}}Repo implements {{feature_name.pascalCase()}}Repo {
  final {{feature_name.pascalCase()}}Client client;

  I{{feature_name.pascalCase()}}Repo({required this.client});
  
  ///TODO: Todo function
}
