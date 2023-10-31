import 'package:flutter/material.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_ct/features/todo/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  configureDependencies();
  await Hive.initFlutter();
  registerAdapter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt<TodoBloc>(),
      child: MaterialApp.router(
        theme: ThemeUtils.theme,
        routerConfig: RouteClass.goRouter,
      ),
    );
  }
}
