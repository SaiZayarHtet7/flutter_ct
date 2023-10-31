import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';{{#use_equatable}}
import 'package:equatable/equatable.dart';{{/use_equatable}}

import 'package:injectable/injectable.dart';
part '{{feature_name.snakeCase()}}_state.dart';

@Injectable()
class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Cubit() : super(const {{feature_name.pascalCase()}}Initial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
