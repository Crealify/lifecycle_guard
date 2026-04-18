import 'package:flutter/material.dart';
import 'package:lifecycle_guard_android/lifecycle_guard_android.dart';

/// ---------------------------------------------------------------------------
/// Lifecycle Guard Android - Platform Specific Example
/// 
/// This example demonstrates how to use the Android implementation directly.
/// This is useful if you are targeting Android only or need to access
/// Android-specific features of the guard.
/// ---------------------------------------------------------------------------

void main() {
  // Ensure the Flutter framework is ready for native communication
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AndroidGuardExampleApp());
}

class AndroidGuardExampleApp extends StatelessWidget {
  const AndroidGuardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guard Android Demo',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const AndroidHomeScreen(),
    );
  }
}

class AndroidHomeScreen extends StatelessWidget {
  const AndroidHomeScreen({super.key});

  /// Starts a secure task using the Android-specific implementation
  Future<void> _startSecureTask() async {
    try {
      // We use LifecycleGuardAndroid() directly here.
      // On Android, this triggers a Foreground Service of type 'dataSync'.
      await LifecycleGuardAndroid().runSecureTask(
        id: "android_backup_task_${DateTime.now().millisecondsSinceEpoch}",
        payload: {
          "platform": "android",
          "serviceType": "dataSync",
          "importance": "high",
        },
      );
      
      debugPrint("Android Guard Service started successfully.");
    } catch (e) {
      debugPrint("Error starting Android Guard: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛡️ Android Lifecycle Guard'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.android, size: 100, color: Colors.green),
            const SizedBox(height: 24),
            const Text(
              'Android Implementation Demo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'This example uses a Foreground Service to ensure your task survives app swipes on Android 15+.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _startSecureTask,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start Android Protected Task'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
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
