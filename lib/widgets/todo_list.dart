import 'package:flutter/material.dart';
import 'package:todo_flutter/models/todo.dart';
import 'package:todo_flutter/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({@required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getAllItems(),
    );
  }

  List<Widget> getAllItems() {
    return todos.map((todo) => TodoItem(todo: todo)).toList();
  }
}
