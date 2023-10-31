part of 'edit_todo_bloc.dart';

sealed class EditTodoEvent extends Equatable {
  const EditTodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends EditTodoEvent {
  final TodoModel todoModel;

 const AddTodo({required this.todoModel});
  
}
