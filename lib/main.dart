import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_provider/homepage.dart';

import 'models/todomodels.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: myapp(),
    ),
  );
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Provider Todo App",
      home: const homepage(),
    );
  }
}
