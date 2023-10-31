import 'package:flutter_ct/features/features.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

typedef TodoList = List<TodoModel>;

@HiveType(typeId: 1)
class TodoModel implements Todo {
  @override
  @HiveField(0)
  final String? id;

  @override
  @HiveField(1)
  final String? title;

  TodoModel({this.id, this.title, this.type});

  TodoModel copyWith({String? id, String? title,int? type})=>TodoModel(
    id:id??this.id,title: title??this.title,type:type??this.type,
  );

  factory TodoModel.newTodo({required String title}) {
    String todoId = const Uuid().v4();
    return TodoModel(id: todoId, title: title,type:TodoType.progressing.i);
  }

  

  @override
  @HiveField(2)
  final int? type;
}
