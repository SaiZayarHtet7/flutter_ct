import 'package:flutter/material.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_ct/features/features.dart';
import 'package:go_router/go_router.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TodoBody();
  }
}

class TodoBody extends StatefulWidget {
  const TodoBody({super.key});

  @override
  State<TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<TodoBody> {
  @override
  void initState() {
    context.read<TodoBloc>().add(const FetchTodo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        actions: [
          IconButton(
            key:const Key("create_icon"),
              onPressed: () {
                context.push(Routes.addTodo);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            debugPrint(state.status.toString());

            if (state.status == TodoStatus.data) {
              return TodoData(
                key: const ValueKey("todo_data_widget"),
                todoList: state.todoList ?? []);
            }

            if (state.status == TodoStatus.noData) {
              return NoDataWidget(
                key: const Key("no_data_widget"),
                message: state.msg ?? "",
              );
            }
            if (state.status == TodoStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class NoDataWidget extends StatelessWidget {
  final String message;
  const NoDataWidget({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          10.gap(),
          MaterialButton(
            key: const Key("create_todo_btn"),
            color: Colors.blue,
            onPressed: () {
              /// to insert todo
              context.push(Routes.addTodo);
            },
            child: const Text("Add Todo"),
          )
        ],
      ),
    );
  }
}
