import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Todo {
  late int id;
  late String title;
  late String description;
  bool isimportant;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.isimportant});
}

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get items => _todos;

//Add todo
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  //remove
  void removeTodo() {
    _todos.clear();
    notifyListeners();
  }

  //To delete Todo By Id
  void deleteTodo(int i) {
    _todos.removeAt(i);
    notifyListeners();
  }

  // To make is important
  void Changeisimportant(int i) {
    _todos[i].isimportant = !_todos[i].isimportant;
    notifyListeners();
  }
}
