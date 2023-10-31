abstract class Todo {
  final String? id;
  final String? title;
  final int? type;

  Todo({this.id, this.title, this.type});
}

enum TodoType {
  completed(1),
  progressing(0);

 const TodoType(this. i);
  final int i;
}
