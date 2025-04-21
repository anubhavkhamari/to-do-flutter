import 'package:flutter/material.dart';
import 'package:todo/pages/AddTaskPage.dart';
import 'package:todo/pages/TaskListPage.dart';

void main(){
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do App",
      theme: ThemeData.dark(),
      home: const TaskListPage(),
      routes: {
        "/add" : (context) => const AddTaskPage(),
      }
    );
  }
}