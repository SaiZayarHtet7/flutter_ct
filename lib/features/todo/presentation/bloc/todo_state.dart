part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, data, error,noData }

class TodoState extends Equatable {
  final TodoStatus status;
  final TodoList? todoList;
  final String? msg;
  const TodoState({
    required this.status,
    this.todoList,
    this.msg,
  });

  @override
  List<Object> get props => [status];

  TodoState copyWith(
      {required TodoStatus status, TodoList? todoList, String? msg}) {
    return TodoState(
        status: status,
        todoList: todoList ?? this.todoList,
        msg: msg ?? this.msg);
  }
}
