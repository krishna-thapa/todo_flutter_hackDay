import 'package:flutter/material.dart';

class Todo {
  int todoID;
  String title;
  bool completed;
  DateTime createdDate;
  DateTime lastUpdatedDate;

  Todo(
      {this.todoID,
      @required this.title,
      this.completed = false,
      this.createdDate,
      this.lastUpdatedDate});

  DateTime dateTime() => DateTime.now();

  void toggleCompleted() {
    completed = !completed;
  }
}
