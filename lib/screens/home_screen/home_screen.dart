import 'package:flutter/material.dart';

class Task {
  String name;
  String difficulty;

  Task({required this.name, required this.difficulty});
}

class TaskTimeEstimationPage extends StatefulWidget {
  @override
  _TaskTimeEstimationPageState createState() => _TaskTimeEstimationPageState();
}

class _TaskTimeEstimationPageState extends State<TaskTimeEstimationPage> {
  final List<Task> tasks = [];
  final TextEditingController _nameController = TextEditingController();
  String _selectedDifficulty = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Task Time Estimation'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Form to add a new task
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Task',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  // Text field to enter task name
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Task Name'),
                  ),
                  SizedBox(height: 8),
                  // Dropdown button to select task difficulty
                  DropdownButtonFormField<String>(
                    value: _selectedDifficulty.isNotEmpty
                        ? _selectedDifficulty
                        : null,
                    hint: Text('Select Difficulty'),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedDifficulty = value!;
                      });
                    },
                    items: <String>['Easy', 'Medium', 'Hard']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  // Add button
                  ElevatedButton(
                    onPressed: _addTask,
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
            // List view to display tasks
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(task.name),
                    subtitle: Text(task.difficulty),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addTask() {
    final name = _nameController.text.trim();
    if (name.isNotEmpty && _selectedDifficulty.isNotEmpty) {
      setState(() {
        tasks.add(Task(name: name, difficulty: _selectedDifficulty));
        // Clearing the text field and selected difficulty after adding task
        _nameController.clear();
        _selectedDifficulty = '';
      });
    }
  }
}
