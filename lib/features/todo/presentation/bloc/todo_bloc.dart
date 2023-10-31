import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_ct/features/features.dart';

import 'package:injectable/injectable.dart';
part 'todo_event.dart';
part 'todo_state.dart';

@Injectable()
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUseCase todoUseCase;

  TodoBloc({required this.todoUseCase})
      : super(const TodoState(status: TodoStatus.initial)) {
    on<FetchTodo>(_onCustomTodoEvent);
    on<CheckAsComplete>(_checkAsComplete);

    on<CheckAsProgressing>(_checkAsProgressing);

    on<DeleteTodo>(_deleteTodo);
  }

  FutureOr<void> _onCustomTodoEvent(
    FetchTodo event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: TodoStatus.loading));
    var data = await todoUseCase.getTodoList();
    data.fold((l) {
      if (l is LogicError) {
        emit(state.copyWith(status: TodoStatus.error, msg: l.e));
      }
    }, (r) {
      if (r.isEmpty) {
        emit(state.copyWith(status: TodoStatus.noData, msg: "No Todo!"));
      } else {
        emit(state.copyWith(status: TodoStatus.data, todoList: r));
      }
    });
  }

  FutureOr<void> _checkAsComplete(
      CheckAsComplete event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading));
    final data = await todoUseCase.checkTodoComplete(event.todoModel);
    data.fold((l) {
      if (l is LogicError) {
        emit(state.copyWith(status: TodoStatus.error, msg: l.e));
      }
    }, (r) {
      if (r.isEmpty) {
        emit(state.copyWith(status: TodoStatus.noData, msg: "No Todo!"));
      } else {
        emit(state.copyWith(status: TodoStatus.data, todoList: r));
      }
    });
  }

  FutureOr<void> _checkAsProgressing(
      CheckAsProgressing event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading));
    final data = await todoUseCase.checkTodoProgressing(event.todoModel);
    data.fold((l) {
      if (l is LogicError) {
        emit(state.copyWith(status: TodoStatus.error, msg: l.e));
      }
    }, (r) {
      if (r.isEmpty) {
        emit(state.copyWith(status: TodoStatus.noData, msg: "No Todo!"));
      } else {
        emit(state.copyWith(status: TodoStatus.data, todoList: r));
      }
    });
  }

  FutureOr<void> _deleteTodo(DeleteTodo event, Emitter<TodoState> emit) async{
   
    emit(state.copyWith(status: TodoStatus.loading));
    final data = await todoUseCase.deleteTodoList(id:event.todoModel.id??'');
    data.fold((l) {
      if (l is LogicError) {
        emit(state.copyWith(status: TodoStatus.error, msg: l.e));
      }
    }, (r) {
      if (r.isEmpty) {
        emit(state.copyWith(status: TodoStatus.noData, msg: "No Todo!"));
      } else {
        emit(state.copyWith(status: TodoStatus.data, todoList: r));
      }
    }); 
  }
}
