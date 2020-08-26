import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/providers/todo_provider.dart';
import 'package:todo_flutter/widgets/todo_list.dart';

class CompletedTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<TodoProvider>(
      builder: (context, todos, child) => TodoList(todos: todos.completedTodos),
    ));
  }
}
