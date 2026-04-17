# lifecycle_guard 🛡️

**Fix background app kills instantly.** 

Ensure your mission-critical Flutter tasks survive app termination and aggressive OS battery management. Built for Android 15+ and iOS BGTaskScheduler.

---

## ✨ Features
- **Isolate Protection**: Boots a lightweight secondary engine for background tasks.
- **Android 15+ Ready**: Full `dataSync` Foreground Service compliance.
- **One-Click Implementation**: Clean static API for rapid integration.
- **Native Stability**: Prevents data loss during OS-initiated termination.

## 🎥 Demo
![Demo GIF Placeholder](https://github.com/Crealify/lifecycle_guard/raw/main/doc/demo.gif)
> *Coming soon: A GIF showing a task surviving an app force-close.*

## 🚀 Quick Start (30 Seconds)

### 1. Android Setup
Add the service to your `AndroidManifest.xml`:
```xml
<service
    android:name="com.crealify.lifecycle_guard_android.LifecycleService"
    android:foregroundServiceType="dataSync"
    android:exported="false">
</service>
```

### 2. Usage
```dart
import 'package:lifecycle_guard/lifecycle_guard.dart';

void main() {
  LifecycleGuard.runSecureTask(
    id: "sync_001",
    payload: {"retry": true}
  );
}
```

## 🛠 Supported Scenarios
- ✅ **Gradle Issues**: Handles background plugin initialization gracefully.
- ✅ **App Termination**: Keeps the logic alive even if the UI is swiped away.
- ✅ **Battery Optimization**: Negotiates with "Doze Mode" for critical execution.

## 🔐 Safety First
- **Non-Destructive**: No `rm -rf` or hidden scripts.
- **User-Triggered**: Logic only runs when you explicitly call `runSecureTask`.
- **Transparency**: Transparent Android notifications keep the user informed.

---

### 🧭 Senior Engineer Verdict
> "Simple, reliable, useful. Don't build a complex background engine when you can just guard the lifecycle."

---

## 🤝 Contributing
Contributions are welcome! If you have a fix for a specific native edge case, please open a PR.

**License**: BSD 3-Clause
**Repository**: [github.com/Crealify/lifecycle_guard](https://github.com/Crealify/lifecycle_guard)
