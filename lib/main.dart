import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/providers/todo_provider.dart';
import 'package:todo_flutter/screens/home.dart';


void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todos',
        theme: ThemeData.light(),
        home: Home(),
      ),
    );
  }
}