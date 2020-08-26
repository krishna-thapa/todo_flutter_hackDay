import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/todo.dart';
import 'package:todo_flutter/providers/todo_provider.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final todoTitleController = TextEditingController();
  bool isCompleted = false;

  @override
  void dispose() {
    todoTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String text = todoTitleController.text;
    final bool completed = isCompleted;
    if (text.isNotEmpty) {
      final Todo todo = Todo(title: text, completed: completed);
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add task")),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(controller: todoTitleController),
                CheckboxListTile(
                    value: isCompleted,
                    onChanged: (checked) => setState(() {
                          isCompleted = checked;
                        }),
                    title: Text("Is completed?")),
                RaisedButton(child: Text("Add"), onPressed: onAdd)
              ],
            ),
          )
        ],
      ),
    );
  }
}
