import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/todo.dart';
import 'package:todo_flutter/providers/todo_provider.dart';

class AddTodo extends StatefulWidget {
  final int todoID;
  bool get isEditing => todoID != -1;

  const AddTodo({Key key, this.todoID}) : super(key: key);

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
      final Todo todo = Todo(
          title: text,
          completed: completed,
          createdDate: DateTime.now(),
          lastUpdatedDate: DateTime.now());
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.isEditing ? "Edit Todo" : "Add Todo")),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: todoTitleController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter the todo item"),
                ),
                CheckboxListTile(
                    value: isCompleted,
                    onChanged: (checked) => setState(() {
                          isCompleted = checked;
                        }),
                    title: Text("Is completed?")),
                RaisedButton(
                  child: Icon(Icons.add),
                  onPressed: onAdd,
                  color: Colors.lightBlueAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
