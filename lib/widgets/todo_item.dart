import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_flutter/models/todo.dart';
import 'package:todo_flutter/providers/todo_provider.dart';
import 'package:todo_flutter/screens/add_todo.dart';

import 'delete_popup.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({@required this.todo});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.todoID),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        final result =
            await showDialog(context: context, builder: (_) => DeletePopup());
        if (result)
          Provider.of<TodoProvider>(context, listen: false).deleteTodo(todo);
        return result;
      },
      background: Container(
        color: Colors.red[400],
        padding: EdgeInsets.only(left: 16),
        child: Align(
            child: Icon(Icons.delete, color: Colors.white),
            alignment: Alignment.centerLeft),
      ),
      child: ListTile(
        leading: Checkbox(
          value: todo.completed,
          onChanged: (bool checked) {
            //does not need to be re-rendered on state changes
            Provider.of<TodoProvider>(context, listen: false).toggleTodo(todo);
          },
        ),
        title: Text(
          todo.title,
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        subtitle:
            Text("Last edited on ${formatDateTime(todo.lastUpdatedDate)}"),
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTodo(todoID: todo.todoID)));
        },
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }
}
