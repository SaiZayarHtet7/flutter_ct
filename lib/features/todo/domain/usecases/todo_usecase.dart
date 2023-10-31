import 'package:dartz/dartz.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_ct/features/todo/todo.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@Injectable()
class TodoUseCase {
  final TodoRepo todoRepo;
  TodoUseCase({required this.todoRepo});

  Future<Either<Failure, TodoList>> getTodoList() => todoRepo.getTodoList();

  Future<Either<Failure, String>> addTodo(TodoModel todoModel) =>
      todoRepo.addTodoList(todoModel: todoModel);

  Future<Either<Failure, List<TodoModel>>> checkTodoComplete(
          TodoModel todoModel) =>
      todoRepo.checkTodoComplete(todoModel);
  Future<Either<Failure, List<TodoModel>>> checkTodoProgressing(
          TodoModel todoModel) =>
      todoRepo.checkTodoProgressing(todoModel);

  Future<Either<Failure, TodoList>> deleteTodoList({required String id}) =>
      todoRepo.deleteTodoList(id: id);
}
