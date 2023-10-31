import 'package:flutter/material.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_ct/features/features.dart';
import 'package:go_router/go_router.dart';

class TodoData extends StatelessWidget {
  final TodoList todoList;

  const TodoData({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        var todo = todoList[index];
        return InkWell(
          key: ValueKey('todo_data_$index'),
          onTap: () {
            context.push(Routes.editTodo, extra: todo);
          },
          child: ListTile(
            leading: Checkbox(
              key: ValueKey("check_todo_$index"),
              onChanged: (v) {
                if (v!) {
                  context.read<TodoBloc>().add(CheckAsComplete(todo));
                } else {
                  context.read<TodoBloc>().add(CheckAsProgressing(todo));
                }
              },
              value: todo.type == TodoType.completed.i,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  
                  todo.title ?? "",
                  key: ValueKey(todo.title)
                ),
                IconButton(
                  key: ValueKey("delete_todo_$index"),
                    onPressed: () {
                      context.read<TodoBloc>().add(DeleteTodo(todo));
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
