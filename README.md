# lifecycle_guard 🛡️

A bulletproof Flutter plugin for mission-critical background execution. Ensures your tasks survive app kills and aggressive OS battery management.

## ✨ Features
- **Isolate Protection**: Boots a lightweight secondary engine for background tasks.
- **Android Foreground Services**: Compliant with Android 15+ `dataSync` requirements.
- **iOS BGTaskScheduler**: Native integration with Apple's background fetch.
- **Native SQLite Buffer**: Prevents data loss during app termination.

## 🚀 Getting Started

### Android Setup
Add the service to your `AndroidManifest.xml`:
```xml
<service
    android:name="com.example.lifecycle_guard_android.LifecycleService"
    android:foregroundServiceType="dataSync"
    android:exported="false">
</service>
```

### Usage
```dart
import 'package:lifecycle_guard/lifecycle_guard.dart';

void main() {
  LifecycleGuard.runSecureTask(
    id: "sync_001",
    payload: {"retry": true}
  );
}
```

⚠️ **Caveats**
- iOS execution is subject to the system's "Budget" (usually 30 seconds).
- Android requires a persistent notification for Foreground Services.

---

### 🛠 Essential Needs Checklist

1.  **Isolate Stability**: Always mark your background entry points with `@pragma('vm:entry-point')`.
2.  **Binary Compatibility**: Use **Dart FFI** instead of MethodChannels if you are doing real-time processing (like audio/video) to avoid the 50ms "Bridge Lag."
3.  **Permissions**: Ensure you request `PERMISSION_POST_NOTIFICATIONS` on Android 13+ or your Foreground Service will be silent/invisible.
4.  **Testing**: Use a physical device. Simulators/Emulators do not replicate the aggressive battery-saving "Doze Mode" that kills background plugins.
