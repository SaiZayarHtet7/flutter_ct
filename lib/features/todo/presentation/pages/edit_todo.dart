import 'package:flutter/material.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_ct/features/features.dart';
import 'package:go_router/go_router.dart';

class EditTodo extends StatelessWidget {
  final TodoModel? todoModel;
  const EditTodo({super.key, this.todoModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditTodoBloc>(),
      child: TodoModelBody(
        todoModel: todoModel,
      ),
    );
  }
}

class TodoModelBody extends StatefulWidget {
  final TodoModel? todoModel;
  const TodoModelBody({super.key, this.todoModel});

  @override
  State<TodoModelBody> createState() => _TodoModelBodyState();
}

class _TodoModelBodyState extends State<TodoModelBody> {
  TextEditingController todoController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.todoModel != null) {
      todoController.text = widget.todoModel?.title ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isNewMode = widget.todoModel == null;
    return BlocListener<EditTodoBloc, EditTodoState>(
      listener: (context, state) {
        if (state.status == EditTodoStatus.success) {
          context.showSnack(
              snackBarType: SnackBarTypes.success,
              content: Text(
                state.msg ?? "",
                style: const TextStyle(color: Colors.white),
              ));

          /// # updating the todo list after success inserting
          context.read<TodoBloc>().add(const FetchTodo());
          Future.delayed(
              const Duration(milliseconds: 400), () => context.pop());
        }
        if (state.status == EditTodoStatus.error) {
          context.showSnack(
              snackBarType: SnackBarTypes.error,
              content: Text(
                state.msg ?? "",
                style: const TextStyle(color: Colors.white),
              ));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(isNewMode ? "Add Todo" : "Edit Todo")),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        key: const Key("title_text_field"),
                          controller: todoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter todo please";
                            }
                            return null;
                          },
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: "Enter your todo ",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(width: 1)))),
                      20.gap(),
                      MaterialButton(
                        key: const Key("edit_btn"),
                          color: Colors.blue,
                          child: Text(
                            isNewMode ? "Create Todo" : "Edit Todo",
                            style: const TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              if (isNewMode) {
                                TodoModel todoModel =
                                    TodoModel.newTodo(title: todoController.text);
                                context
                                    .read<EditTodoBloc>()
                                    .add(AddTodo(todoModel: todoModel));
                              } else {
                                context.read<EditTodoBloc>().add(AddTodo(
                                    todoModel: widget.todoModel!
                                        .copyWith(title: todoController.text)));
                              }
                            }
                          })
                    ],
                  ),
                  BlocBuilder<EditTodoBloc, EditTodoState>(
                    builder: (context, state) {
                      if (state.status == EditTodoStatus.loading) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black38,
                          child: const Center(child: CircularProgressIndicator()),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
