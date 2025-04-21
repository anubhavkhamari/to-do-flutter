import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController controller = TextEditingController();
  String category = 'Normal'; // Default category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Enter task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: category,
              onChanged: (String? newValue) {
                setState(() {
                  category = newValue!;
                });
              },
              items: <String>['Normal', 'Important', 'Very Important']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final text = controller.text;
                if (text.isNotEmpty) {
                  Navigator.pop(context, {'task': text, 'category': category});
                }
              },
              child: const Text('Add Task'),
            )
          ],
        ),
      ),
    );
  }
}
