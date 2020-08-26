import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_flutter/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(title: "First todo in the list"),
    Todo(title: "Second todo in the list"),
    Todo(title: "Done with todo list")
  ];

  //ensure that our getters can not be manipulated in any way from outside
  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(_todos);
  UnmodifiableListView<Todo> get incompleteTodos =>
      UnmodifiableListView(_todos.where((todo) => !todo.completed));
  UnmodifiableListView<Todo> get completedTodos =>
      UnmodifiableListView(_todos.where((todo) => todo.completed));

  void addTodo(Todo todo) {
    _todos.add(todo);
    //notifies flutter whether the state change requires a re-render of UI or not.
    //Only the UI widget which are listening to the provider will be re-rendered.
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    final todoIndex = _todos.indexOf(todo);
    _todos[todoIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
