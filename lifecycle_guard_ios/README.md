<div align="center">

<img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png" width="140" alt="lifecycle_guard Logo">

# lifecycle_guard_ios

**The robust iOS implementation for mission-critical background execution.**

This package ensures your background tasks get the execution time they need on iOS devices using native `BGTaskScheduler` APIs.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v1.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard_ios)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey)](https://pub.dev/packages/lifecycle_guard)

</div>

---

## 🚀 Why this package?
iOS is extremely strict about background execution. Once a user minimizes or swipes an app away, the process is suspended almost immediately.
`lifecycle_guard_ios` bridges to the **BGTaskScheduler** API, allowing your app to register "Background Processing Tasks" that Apple's kernel will prioritize and execute even when the app is terminated.

---

## ⚙️ Step-by-Step Installation (Detailed)

### 1. Add Dependency
Add this to your `pubspec.yaml`:
```yaml
dependencies:
  lifecycle_guard_ios: ^1.0.1
```

### 2. Configure Capabilities (Xcode)
To allow background execution on iOS, you must enable specific capabilities:
1.  Open your project in **Xcode**.
2.  Select your target and go to **Signing & Capabilities**.
3.  Click **+ Capability** and add **Background Modes**.
4.  Check the following two boxes:
    - `Background fetch`
    - `Background processing`

### 3. Update Info.plist
You must register the task identifier so the system knows which tasks to allow. Open `ios/Runner/Info.plist` and add:

```xml
<key>BGTaskSchedulerPermittedIdentifiers</key>
<array>
    <string>com.crealify.lifecycle_guard.background_task</string>
</array>
```

---

## 💡 Full Example Code (iOS-Ready)

```dart
import 'package:flutter/material.dart';
import 'package:lifecycle_guard_ios/lifecycle_guard_ios.dart';

void main() {
  // Ensure Flutter is ready for native calls
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: IOSGuardDemo()));
}

class IOSGuardDemo extends StatelessWidget {
  const IOSGuardDemo({super.key});

  Future<void> _startIOSTask() async {
    // 🛡️ Register the Background Processing Task
    // This tells iOS to schedule a processing window for your task
    await LifecycleGuardIos().runSecureTask(
      id: "sync_records_ios",
      payload: {"priority": "high"},
    );
    print("iOS BGTask scheduled!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iOS Lifecycle Guard')),
      body: Center(
        child: ElevatedButton(
          onPressed: _startIOSTask,
          child: const Text('Schedule Background Task'),
        ),
      ),
    );
  }
}
```

---

## 🦾 Features (iOS)
- **BGTaskScheduler Integration**: Official Apple-recommended way for background work.
- **Resource Management**: Respects iOS system budgets while ensuring critical data sync gets priority.
- **Isolate Protection**: Boots a lightweight Dart Isolate to handle the task logic.

---

## 📄 License
BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">
Built with ❤️ by [Crealify](https://anil-bhattarai.com.np)
</div>
