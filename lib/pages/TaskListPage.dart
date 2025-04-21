import 'package:flutter/material.dart';
import 'package:todo/pages/AddTaskPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Map<String, String>> tasks = [];

  // Load saved tasks from local storage
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTasks = prefs.getStringList('tasks') ?? [];

    setState(() {
      tasks = savedTasks
          .map((task) {
            final parts = task.split('|'); // Split the saved task string into task and category
            return {'task': parts[0], 'category': parts[1]};
          })
          .toList();
    });
  }

  // Save tasks to local storage
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTasks = tasks
        .map((task) => '${task['task']}|${task['category']}') // Join task and category
        .toList();
    await prefs.setStringList('tasks', savedTasks);
  }

  @override
  void initState() {
    super.initState();
    loadTasks(); // Load tasks when screen opens
  }

  // Function to return a color based on the task category
  Color getCategoryColor(String category) {
    switch (category) {
      case 'Very Important':
        return Colors.red;
      case 'Important':
        return const Color.fromARGB(255, 255, 128, 0);
      case 'Normal':
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: getCategoryColor(task['category']!), // Set background color based on category
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(task['task']!), // Display task text
              subtitle: Text(task['category']!), // Display category text
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    tasks.removeAt(index);
                    saveTasks(); // Update saved tasks after removal
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskPage()),
          );

          if (newTask != null) {
            setState(() {
              tasks.add(newTask); // Add new task with category
              saveTasks(); // Save tasks after adding
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
