import 'package:dartz/dartz.dart';
import 'package:flutter_ct/core/errors/failure.dart';
import 'package:flutter_ct/features/todo/data/data_sources/box/todo_box.dart';
import 'package:flutter_ct/features/todo/data/models/todo_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

@Injectable(as: TodoRepo)
class ITodoRepo implements TodoRepo {
  ITodoRepo();
  @override
  Future<Either<Failure, String>> addTodoList(
      {required TodoModel todoModel}) async {
    try {
      TodoBox todoBox = await TodoBox.instance;
      todoBox.saveTodo(todoModel);
      return const Right("Successfully inserted");
    } catch (e) {
      return Left(LogicError(e));
    }
  }

  @override
  Future<Either<Failure, TodoList>> deleteTodoList({required String id})async {
   try {
      TodoBox todoBox = await TodoBox.instance;
      await todoBox.deleteTodo(id);
      TodoList todoList =  todoBox.getAllTodoList();
      return Right(todoList);
    } catch (e) {
      return Left(LogicError(e));
    }
  }

  @override
  Future<Either<Failure, TodoList>> getTodoList() async {
    try {
      TodoBox todoBox = await TodoBox.instance;
      TodoList todoList =  todoBox.getAllTodoList();
      return Right(todoList);
    } catch (e) {
      return Left(LogicError(e));
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> checkTodoComplete(
      TodoModel todoModel) async {
    try {
      TodoBox todoBox = await TodoBox.instance;
      await todoBox.saveTodo(todoModel.copyWith(type: TodoType.completed.i));
      TodoList todoList =  todoBox.getAllTodoList();
      return Right(todoList);
    } catch (e) {
      return Left(LogicError(e));
    }
  }
  @override
  Future<Either<Failure, List<TodoModel>>> checkTodoProgressing(
      TodoModel todoModel) async {
    try {
      TodoBox todoBox = await TodoBox.instance;
      await todoBox.saveTodo(todoModel.copyWith(type: TodoType.progressing.i));
      TodoList todoList =  todoBox.getAllTodoList();
      return Right(todoList);
    } catch (e) {
      return Left(LogicError(e));
    }
  }
}
