<div align="center">

<img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png" width="140" alt="lifecycle_guard Logo">

# lifecycle_guard_android

**The bulletproof Android implementation for mission-critical background execution.**

This package ensures your background tasks survive termination on Android devices using a robust Foreground Service architecture.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v1.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard_android)
[![Platform](https://img.shields.io/badge/Platform-Android-green)](https://pub.dev/packages/lifecycle_guard)

</div>

---

## 🚀 Why this package?
Android is aggressive. When a user swipes your app away, the OS often kills your Dart Isolate, terminating all background tasks. 
`lifecycle_guard_android` solves this by wrapping your task in an **Android Foreground Service** (type: `dataSync`), which has the highest survival priority on the platform.

---

## ⚙️ Step-by-Step Installation (Detailed)

### 1. Add Dependency
Add this to your `pubspec.yaml`:
```yaml
dependencies:
  lifecycle_guard_android: ^1.0.1
```

### 2. Configure AndroidManifest.xml
Open `android/app/src/main/AndroidManifest.xml` and follow these three steps:

#### A. Add Permissions
Add these *outside* the `<application>` tag:
```xml
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_DATA_SYNC" />
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

#### B. Declare the Service
Add this *inside* the `<application>` tag:
```xml
<service
    android:name="com.crealify.lifecycle_guard_android.LifecycleService"
    android:foregroundServiceType="dataSync"
    android:exported="false">
</service>
```

#### C. Notification Icon (Optional but Recommended)
The foreground service shows a notification. To use a custom icon, ensure you have a drawable named `ic_launcher` or update the code in your implementation.

---

## 💡 Full Example Code (Android-Ready)

```dart
import 'package:flutter/material.dart';
import 'package:lifecycle_guard_android/lifecycle_guard_android.dart';

void main() {
  // Ensure Flutter is ready for native calls
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: AndroidGuardDemo()));
}

class AndroidGuardDemo extends StatelessWidget {
  const AndroidGuardDemo({super.key});

  Future<void> _startAndroidTask() async {
    // 🛡️ Start the Foreground Service
    // This will show a persistent notification and keep the process alive
    await LifecycleGuardAndroid().runSecureTask(
      id: "sync_records_android",
      payload: {"type": "auto_backup"},
    );
    print("Android Guard is now active!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Android Lifecycle Guard')),
      body: Center(
        child: ElevatedButton(
          onPressed: _startAndroidTask,
          child: const Text('Start Protected Sync'),
        ),
      ),
    );
  }
}
```

---

## 🦾 Features (Android)
- **Android 15+ Compliance**: Uses the required `dataSync` service type.
- **Battery Optimization Override**: Helps tasks survive Doze Mode.
- **Swipe-to-Kill Protection**: The service stays alive even if the user swipes the app away from the multitasking view.

---

## 📄 License
BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">
Built with ❤️ by [Crealify](https://anil-bhattarai.com.np)
</div>
