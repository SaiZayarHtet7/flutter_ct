import 'package:flutter_ct/features/todo/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

void registerAdapter() {
  Hive.registerAdapter(TodoModelAdapter());// id = 1
}
