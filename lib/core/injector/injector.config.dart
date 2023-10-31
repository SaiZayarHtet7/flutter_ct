// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/features.dart' as _i10;
import '../../features/todo/data/data_sources/remote/i_todo_client.dart'
    as _i12;
import '../../features/todo/data/repo/i_todo_repo.dart' as _i5;
import '../../features/todo/domain/domain.dart' as _i4;
import '../../features/todo/domain/usecases/todo_usecase.dart' as _i6;
import '../../features/todo/presentation/bloc/edit_todo/edit_todo_bloc.dart'
    as _i9;
import '../../features/todo/presentation/bloc/todo_bloc.dart' as _i11;
import '../../features/todo/todo.dart' as _i7;
import '../api/config.dart' as _i3;
import '../api/dio_provider.dart' as _i14;
import '../core.dart' as _i13;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioProvider = _$DioProvider();
  gh.factory<_i3.IConfig>(() => _i3.AppConfig());
  gh.factory<_i4.TodoRepo>(() => _i5.ITodoRepo());
  gh.factory<_i6.TodoUseCase>(
      () => _i6.TodoUseCase(todoRepo: gh<_i7.TodoRepo>()));
  gh.singleton<_i8.Dio>(dioProvider.dio(gh<_i3.IConfig>()));
  gh.factory<_i9.EditTodoBloc>(
      () => _i9.EditTodoBloc(usecase: gh<_i10.TodoUseCase>()));
  gh.factory<_i11.TodoBloc>(
      () => _i11.TodoBloc(todoUseCase: gh<_i10.TodoUseCase>()));
  gh.factory<_i7.TodoClient>(() => _i12.ITodoClient(
        dio: gh<_i8.Dio>(),
        config: gh<_i13.IConfig>(),
      ));
  return getIt;
}

class _$DioProvider extends _i14.DioProvider {}
