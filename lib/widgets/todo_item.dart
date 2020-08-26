import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_flutter/models/todo.dart';
import 'package:todo_flutter/providers/todo_provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({@required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool checked) {
          //does not need to be re-rendered on state changes
          Provider.of<TodoProvider>(context, listen: false).toggleTodo(todo);
        },
      ),
      title: 
      Text(
        todo.title,
        style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        subtitle: Text("Last edited on 26/08/2020"),
      trailing: IconButton(
        icon: Icon(
          Icons.remove_circle_outline,
          color: Colors.red,
        ),
        onPressed: () {
          //does not need to be re-rendered on state changes
          Provider.of<TodoProvider>(context, listen: false).deleteTodo(todo);
        },
      ),
    );
  }
}
