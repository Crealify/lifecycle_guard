import 'package:flutter/material.dart';
import 'package:lifecycle_guard_ios/lifecycle_guard_ios.dart';

/// ---------------------------------------------------------------------------
/// Lifecycle Guard iOS - Platform Specific Example
/// 
/// This example demonstrates how to use the iOS implementation directly.
/// This is useful if you are targeting iOS only or need to access
/// iOS-specific features of the guard like BGTaskScheduler configurations.
/// ---------------------------------------------------------------------------

void main() {
  // Ensure the Flutter framework is ready for native communication
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const IosGuardExampleApp());
}

class IosGuardExampleApp extends StatelessWidget {
  const IosGuardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guard iOS Demo',
      theme: ThemeData(primarySwatch: Colors.grey, useMaterial3: true),
      home: const IosHomeScreen(),
    );
  }
}

class IosHomeScreen extends StatelessWidget {
  const IosHomeScreen({super.key});

  /// Starts a secure task using the iOS-specific implementation
  Future<void> _startSecureTask() async {
    try {
      // We use LifecycleGuardIos() directly here.
      // On iOS, this registers a Background Processing Task (BGProcessingTask)
      // with the Apple system scheduler.
      await LifecycleGuardIos().runSecureTask(
        id: "ios_sync_task_${DateTime.now().millisecondsSinceEpoch}",
        payload: {
          "platform": "ios",
          "api": "BGTaskScheduler",
          "identifier": "com.crealify.lifecycle_guard.background_task",
        },
      );
      
      debugPrint("iOS Background Task scheduled successfully.");
    } catch (e) {
      debugPrint("Error scheduling iOS task: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛡️ iOS Lifecycle Guard'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.apple, size: 100, color: Colors.black),
            const SizedBox(height: 24),
            const Text(
              'iOS Implementation Demo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'This example uses BGTaskScheduler to request processing time from iOS, ensuring your task completes after the app is suspended.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _startSecureTask,
                icon: const Icon(Icons.timer),
                label: const Text('Schedule iOS Background Task'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
