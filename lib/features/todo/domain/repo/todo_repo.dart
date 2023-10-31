import 'package:dartz/dartz.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_ct/features/todo/todo.dart';

abstract class TodoRepo {
  Future<Either<Failure, List<TodoModel>>> getTodoList();
  Future<Either<Failure, List<TodoModel>>> checkTodoComplete(TodoModel todoModel);
  Future<Either<Failure, List<TodoModel>>> checkTodoProgressing(TodoModel todoModel);
  Future<Either<Failure, TodoList>> deleteTodoList({required String id});

  Future<Either<Failure, String>> addTodoList({required TodoModel todoModel});
  
}
