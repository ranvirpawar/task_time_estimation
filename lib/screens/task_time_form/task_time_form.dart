import 'package:flutter/material.dart';
import 'package:task_metric/screens/task_time_form/create_task_form.dart';

class Task {
  final String id;
  final String taskName;
  final String taskLevel;
  final String taskTime;
  final String taskDescription;

  Task({
    required this.id,
    required this.taskName,
    required this.taskLevel,
    required this.taskTime,
    required this.taskDescription,
  });
}

class TaskTimeEstimationScreen extends StatefulWidget {
  const TaskTimeEstimationScreen({Key? key}) : super(key: key);

  @override
  State<TaskTimeEstimationScreen> createState() => _TaskTimeEstimationState();
}

class _TaskTimeEstimationState extends State<TaskTimeEstimationScreen> {
  List<Task> tasks = [
    Task(
      id: "Task1",
      taskName: "Task 1",
      taskLevel: "Easy",
      taskTime: "1 hour",
      taskDescription: "Description of Task 1",
    ),
    Task(
      id: "Task2",
      taskName: "Task 2",
      taskLevel: "Medium",
      taskTime: "2 hours",
      taskDescription: "Description of Task 2",
    ),
    Task(
      id: "Task3",
      taskName: "Task 3",
      taskLevel: "Hard",
      taskTime: "3 hours",
      taskDescription: "Description of Task 3",
    ),
    Task(
      id: "Task4",
      taskName: "Task 4",
      taskLevel: "Very Hard",
      taskTime: "4 hours",
      taskDescription: "Description of Task 4",
    ),
  ];

  late Task selectedTask;

  @override
  void initState() {
    super.initState();
    selectedTask = tasks.first;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Task Time Estimation",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<Task>(
                    value: selectedTask,
                    onChanged: (Task? task) {
                      setState(() {
                        selectedTask = task!;
                      });
                    },
                    items: [
                      ...tasks.map((Task task) {
                        return DropdownMenuItem<Task>(
                          value: task,
                          child: Text(task.taskName),
                        );
                      }).toList(),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Select Task",
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showCreateTaskDialog(context);
                    },
                    child: Text('Create New Task'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Display the selected task details
                Text(
                  "Estimated Time : ${selectedTask.taskTime}\n",
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Task Level : ${selectedTask.taskLevel}"),
                    
                    GestureDetector(
                      child: Text("Increase Time"),
                    ),
                    if (selectedTask.taskLevel == 'Medium')
                      Icon(Icons.plus_one_outlined, color: Colors.red),
                    if (selectedTask.taskLevel == 'Hard')
                      Icon(Icons.add_outlined, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCreateTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreateTaskDialog(
          onTaskCreated: _addNewTask,
        );
      },
    );
  }

  void _addNewTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
      selectedTask = newTask;
    });
  }
}
