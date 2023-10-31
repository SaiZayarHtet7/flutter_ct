part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class FetchTodo extends TodoEvent {
  const FetchTodo();
}

class CheckAsComplete extends TodoEvent {
  final TodoModel todoModel;
  const CheckAsComplete(this.todoModel);
}

class CheckAsProgressing extends TodoEvent {
  final TodoModel todoModel;
  const CheckAsProgressing(this.todoModel);
}

class DeleteTodo extends TodoEvent {
  final TodoModel todoModel;
  const DeleteTodo(this.todoModel);
}