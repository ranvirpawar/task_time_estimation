import 'package:flutter/material.dart';
import 'package:task_metric/screens/task_time_form/task_time_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 233, 9, 39)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TaskTimeEstimationScreen(),
    );
  }
}
