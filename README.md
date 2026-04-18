<div align="center">

<img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png" width="200" alt="lifecycle_guard Logo">

# lifecycle_guard

**The bulletproof Flutter plugin for mission-critical background execution.**

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v1.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard)
[![License: BSD-3](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE)
[![Guard](https://img.shields.io/badge/Security-Guarded-3FB950?logo=security)](https://github.com/Crealify/lifecycle_guard)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)](#platform-specific-setup-required)

</div>

---

## Live Action: Survival in the Wild
Watch how `lifecycle_guard` keeps your critical logs and data syncing alive even after a manual app swipe.

![Lifecycle Guard Full Demo](https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/lifecycle_guard_plugin_demo.gif)

### Try the Interactive Demos:
*   [**Android Demo**](https://htmlpreview.github.io/?https://github.com/Crealify/lifecycle_guard/blob/main/doc/demoandroid.html) - See Foreground Service protection.
*   [**iOS Demo**](https://htmlpreview.github.io/?https://github.com/Crealify/lifecycle_guard/blob/main/doc/iosdemo.html) - See Background Task scheduling.

---

## Why lifecycle_guard?
Stop losing data when Android or iOS aggressively kills your app.
Modern mobile operating systems are increasingly aggressive at killing processes to save battery.
*   **User Swipes App**: Your Isolate is instantly killed.
*   **System Pressure**: OS reclaims memory, terminating your thread.
*   **Battery Optimization**: Tasks are deferred or canceled.

`lifecycle_guard` ensures your background tasks survive termination, system reboots, and battery optimizations — **guaranteed.**

---

## Key Features
- **Native Protection**: Bridges to Foreground Services (Android) and BGTask (iOS).
- **Android 15 Ready**: Full `dataSync` service type support.
- **iOS BGTask Integration**: Properly utilizes Apple's `BGTaskScheduler`.
- **Zero Config Isolation**: Automatically boots a secondary engine.
- **Type-Safe API**: Simple `payload` support for complex tasks.

---

## Use Cases
- **Data Syncing**: Sending offline records to your server.
- **File Processing**: Compressing or encrypting local files.
- **Media Uploads**: Ensuring a user's video actually finishes.
- **State Updates**: Finalizing critical database transactions.

---

## Step-by-Step Installation

### 1. Add to dependencies
```yaml
dependencies:
  lifecycle_guard: ^1.0.1
```

### 2. Platform Setup (REQUIRED)

#### Android
Open `android/app/src/main/AndroidManifest.xml`:
1.  **Permissions**:
    ```xml
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_DATA_SYNC" />
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    ```
2.  **Service**:
    ```xml
    <service
        android:name="com.crealify.lifecycle_guard_android.LifecycleService"
        android:foregroundServiceType="dataSync"
        android:exported="false">
    </service>
    ```

#### iOS
1.  **Capabilities**: Enable **Background Modes** and check `Background fetch` & `Background processing`.
2.  **Info.plist**:
    ```xml
    <key>BGTaskSchedulerPermittedIdentifiers</key>
    <array>
        <string>com.crealify.lifecycle_guard.background_task</string>
    </array>
    ```

---

## Full Copy-Paste Example
```dart
import 'package:flutter/material.dart';
import 'package:lifecycle_guard/lifecycle_guard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: GuardExample()));
}

class GuardExample extends StatelessWidget {
  const GuardExample({super.key});

  Future<void> _triggerSecureTask() async {
    try {
      // Start the guard
      await LifecycleGuard.runSecureTask(
        id: "sync_records_001",
        payload: {"action": "sync_offline_db"},
      );
      
      debugPrint("Guard is active. You can now close the app.");
      
      // ... perform your critical work here ...
      
      // STOP the guard when finished
      await LifecycleGuard.stopSecureTask();
      
    } catch (e) {
      debugPrint("Failed to start guard: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('lifecycle_guard Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: _triggerSecureTask,
          child: const Text('Start Protected Background Task'),
        ),
      ),
    );
  }
}
```

---

## Stopping the Guard
Once your critical task is finished, you **must** stop the guard to release native resources (like the Android Foreground Service notification).

```dart
await LifecycleGuard.stopSecureTask();
```

---

## License
BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">
Built by [Crealify](https://anil-bhattarai.com.np)
</div>
