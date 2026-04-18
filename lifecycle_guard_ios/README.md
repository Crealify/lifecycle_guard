<div align="center">

<img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png" width="140" alt="lifecycle_guard Logo">

# 🍎 lifecycle_guard_ios

**The robust iOS implementation for mission-critical background execution.**

This package ensures your background tasks get the execution time they need on iOS devices using native `BGTaskScheduler` APIs.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v1.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard_ios)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey)](https://pub.dev/packages/lifecycle_guard)

</div>

---

## 🎬 Demo
See the iOS Background Task flow in action:

![Lifecycle Guard iOS Demo](https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/lifecycle_guard_plugin_demo.gif)

---

## 🚀 The iOS Challenge
iOS is notoriously strict. When an app is swiped away or minimized, it is suspended almost instantly. Unlike Android, you cannot simply start a persistent "service."
`lifecycle_guard_ios` utilizes Apple's **BGTaskScheduler** framework to request dedicated processing time from the kernel. This allows your app to finish critical work (like a database sync) even if the UI process has been suspended or terminated.

---

## ⚙️ Step-by-Step Installation (Detailed)

### 1. Add Dependency
Add this to your `pubspec.yaml`:
```yaml
dependencies:
  lifecycle_guard_ios: ^1.0.1
```

### 2. Configure Capabilities (Xcode)
To allow background execution on iOS, you **must** enable specific capabilities in Xcode:
1.  Open your project in **Xcode**.
2.  Select the **Runner** target and go to **Signing & Capabilities**.
3.  Click **+ Capability** and search for **Background Modes**.
4.  Check the following two boxes:
    - `Background fetch`
    - `Background processing` (This is critical for long tasks)

### 3. Update Info.plist
Apple requires you to whitelist your background task identifiers. Open `ios/Runner/Info.plist` and add:

```xml
<key>BGTaskSchedulerPermittedIdentifiers</key>
<array>
    <string>com.crealify.lifecycle_guard.background_task</string>
</array>
```

---

## 💡 Full Example Code (Complete `main.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:lifecycle_guard_ios/lifecycle_guard_ios.dart';

void main() {
  // 1. Initialize Flutter bindings for native channel support
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: IOSGuardExample()));
}

class IOSGuardExample extends StatelessWidget {
  const IOSGuardExample({super.key});

  /// This function requests background processing time from iOS
  Future<void> _triggerIosTask() async {
    try {
      // 🛡️ Register the task with BGTaskScheduler
      // iOS will then allocate a window for your task to run.
      await LifecycleGuardIos().runSecureTask(
        id: "ios_sync_001",
        payload: {
          "user": "developer_pro",
          "action": "secure_data_upload",
        },
      );
      debugPrint("iOS Guard scheduled: Your task is now protected.");
    } catch (e) {
      debugPrint("Failed to schedule iOS task: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iOS Background Guard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.apple, size: 80),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _triggerIosTask,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
              child: const Text('Request Background Processing'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 🦾 iOS Specific Features
- **✅ BGTaskScheduler Integration**: Follows the official Apple architecture for background work.
- **✅ Isolate Protection**: Spawns a dedicated background Isolate to keep your Dart logic running.
- **✅ Resource Management**: Automatically respects iOS system battery and data budgets.
- **✅ Graceful Termination Handling**: Provides hooks to save state if iOS finally decides to reclaim resources.

---

## 📄 License
BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">
Built with ❤️ by [Crealify](https://anil-bhattarai.com.np)
</div>
