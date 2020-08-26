import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/providers/todo_provider.dart';
import 'package:todo_flutter/widgets/todo_list.dart';

class AllTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // provides an easy way to listen for changes in the provider state and re-render accordingly
        child: Consumer<TodoProvider>(
      builder: (context, todos, child) => TodoList(todos: todos.allTodos),
    ));
  }
}
