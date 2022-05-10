import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_provider/databasehelper.dart';

class Todo {
  late int id;
  late String title;
  late String description;
  String isimportant;

//Constructor
  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.isimportant});

  // copy constructor
  Todo copy(
          {int? id, String? title, String? description, String? isimportant}) =>
      Todo(
          id: id ?? this.id,
          title: title ?? this.title,
          description: description ?? this.description,
          isimportant: isimportant ?? this.isimportant);

// get info in map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isimportant": isimportant
    };
  }
}

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = [];
  void loadTodos() async {
    _todos = await Databasehelper.Instance.listAllTodo();
    notifyListeners();
  }

  //getter
  List<Todo> get items => _todos;

//Add todo
  void addTodo(Todo todo) {
    Databasehelper.Instance.addTodo(todo);
    loadTodos();
  }

  //remove
  // void removeTodo() {
  //   _todos.clear();
  //   notifyListeners();
  // }

  //To delete Todo By Id
  void deleteTodo(int i) async {
    await Databasehelper.Instance.deleteTodo(i);
    loadTodos();
  }

  //To delete All
  void deleteAll() async {
    await Databasehelper.Instance.deleteAll();
    loadTodos();
  }

  /// Update Todo
  void updateTodo(Todo todo) async {
    await Databasehelper.Instance.updateTodo(todo);

    loadTodos();
  }
}
