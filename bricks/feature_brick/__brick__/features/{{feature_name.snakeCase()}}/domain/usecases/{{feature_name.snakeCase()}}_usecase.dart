

import 'package:injectable/injectable.dart';

import '../domain.dart';

@Injectable()
class {{feature_name.pascalCase()}}UseCase{
  final {{feature_name.pascalCase()}}Repo {{feature_name.camelCase()}}Repo;
  {{feature_name.pascalCase()}}UseCase ({required this.{{feature_name.camelCase()}}Repo});

}