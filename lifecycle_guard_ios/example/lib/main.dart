import 'package:flutter/material.dart';
import 'package:lifecycle_guard/lifecycle_guard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Lifecycle Guard iOS')),
        body: Center(
          child: ElevatedButton(
            onPressed: () => LifecycleGuard.runSecureTask(id: 'ios_test'),
            child: const Text('Test Background Task'),
          ),
        ),
      ),
    );
  }
}
