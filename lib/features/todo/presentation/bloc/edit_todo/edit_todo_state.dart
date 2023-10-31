part of 'edit_todo_bloc.dart';

enum EditTodoStatus {
  initial,
  loading,
  success,
  error,
}

 class EditTodoState extends Equatable {
  const EditTodoState({required this.status, this.msg});

  final EditTodoStatus status;
  final String? msg;

  EditTodoState copyWith({required EditTodoStatus status, String? msg}) =>
      EditTodoState(status: status, msg: msg ?? this.msg);

  @override
  List<Object> get props => [status];
}
