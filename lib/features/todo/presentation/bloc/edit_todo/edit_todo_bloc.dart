import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_ct/features/features.dart';
import 'package:injectable/injectable.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

@Injectable()
class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  final TodoUseCase usecase;
  EditTodoBloc({required this.usecase})
      : super(const EditTodoState(status: EditTodoStatus.initial)) {
    on<AddTodo>(_addTodo);
  }

  FutureOr<void> _addTodo(AddTodo event, Emitter<EditTodoState> emit) async {
    emit(state.copyWith(status: EditTodoStatus.loading));
    final data = await usecase.addTodo(event.todoModel);
    data.fold((l) {
      if (l is LogicError) {
        emit(state.copyWith(status: EditTodoStatus.error, msg: l.e));
      }
    }, (r) {
      emit(state.copyWith(status: EditTodoStatus.success, msg: r));
    });
  }
}
