import 'package:flutter/material.dart';
import 'package:task_scheduler/auth/sign_in/sign_in_screen.dart';
import 'package:task_scheduler/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    showdebugPrintCheckedModeBanner:
    false;
    return MaterialApp(
      home: TaskTimeEstimationPage(),
    );
  }
}
