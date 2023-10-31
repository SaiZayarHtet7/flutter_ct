import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_ct/features/features.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoBox {
  static const String _key = "todo_box";

  final Box<TodoModel> _box;

  TodoBox._(this._box);

  static Future<TodoBox> get instance async {
    return TodoBox._(await Hive.openBox<TodoModel>(_key));
  }

  foundation.ValueListenable<Box<TodoModel>> get listenable =>
      _box.listenable();

  /// ## for saving the TodoModel
  Future saveTodo(TodoModel todo) async {
    await _box.put(todo.id, todo);
  }

  Future deleteTodo(String id) async {
    return _box.delete(id);
  }

  Future<TodoModel> getTodoModel(String todoId) async {
    return _box.values.toList().where((element) => element.id == todoId).first;
  }

  TodoList getAllTodoList() => _box.values.toList();
}
