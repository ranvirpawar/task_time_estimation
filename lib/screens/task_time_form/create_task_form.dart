import 'package:flutter/material.dart';
import 'package:task_metric/screens/task_time_form/task_time_form.dart';

class CreateTaskDialog extends StatefulWidget {
  final Function(Task) onTaskCreated;

  const CreateTaskDialog({
    Key? key,
    required this.onTaskCreated,
  }) : super(key: key);

  @override
  _CreateTaskDialogState createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskTimeController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();

  String? selectedTaskLevel = 'Easy'; // Default task level

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create New Task'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: taskNameController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            TextField(
              controller: taskTimeController,
              decoration: InputDecoration(labelText: 'Task Time'),
            ),
            DropdownButtonFormField<String>(
              value: selectedTaskLevel,
              items: <String>['Easy', 'Medium', 'Hard', 'Very Hard']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
            TextField(
              controller: taskDescriptionController,
              decoration: InputDecoration(labelText: 'Task Description'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final newTask = Task(
              id: DateTime.now().toString(),
              taskName: taskNameController.text,
              taskLevel: selectedTaskLevel!,
              taskTime: taskTimeController.text,
              taskDescription: taskDescriptionController.text,
            );
            widget.onTaskCreated(newTask);
            Navigator.of(context).pop();
          },
          child: Text('Create'),
        ),
      ],
    );
  }
}
