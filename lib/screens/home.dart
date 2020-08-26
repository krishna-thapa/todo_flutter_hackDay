import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/add_todo.dart';
import 'package:todo_flutter/todo/all_todos.dart';
import 'package:todo_flutter/todo/completed_todos.dart';
import 'package:todo_flutter/todo/incompleted_todos.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            "Todo List",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white70,
            ),
            onPressed: () {},
          ),
          bottom: TabBar(
            controller: controller,
            tabs: <Widget>[
              Tab(text: "All"),
              Tab(text: "Incompleted"),
              Tab(
                text: "Completed",
              )
            ],
          )),
      body: TabBarView(
        controller: controller,
        children: <Widget>[AllTodos(), IncompletedTodos(), CompletedTodos()],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTodo(
                          todoID: -1,
                        )));
          },
          child: Icon(Icons.note_add_outlined)),
    );
  }
}
