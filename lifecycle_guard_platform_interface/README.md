<div align="center">

<img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png" width="140" alt="lifecycle_guard Logo">

# lifecycle_guard_platform_interface

**The common interface contract for mission-critical background execution.**

This package defines the standardized API that ensures `lifecycle_guard` works identically across Android, iOS, and future platforms.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v1.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard_platform_interface)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.3.0-02569B?logo=flutter)](https://flutter.dev)

</div>

---

## 🚀 The Backbone of the Guard
This is a **Platform Interface** package as defined by the [Federated Plugins](https://flutter.dev/to/federated-plugins) architecture. It serves as the single source of truth for the plugin's API, ensuring that whether you are on Android or iOS, the behavior remains consistent.

### Why this package exists:
1.  **Uniformity**: Every platform-specific guard (Android, iOS) is forced to implement the exact same methods.
2.  **Safety**: Prevents runtime errors by providing a static fallback implementation.
3.  **Community Driven**: Allows anyone to build a `lifecycle_guard_windows` or `lifecycle_guard_web` by simply extending this class.

---

## 🛠️ Usage for Platform Implementers

If you are building a new platform implementation for `lifecycle_guard`, you must extend the `LifecycleGuardPlatform` class.

### Example Implementation Structure:

```dart
import 'package:lifecycle_guard_platform_interface/lifecycle_guard_platform_interface.dart';

class MyNewPlatformGuard extends LifecycleGuardPlatform {
  /// Register this implementation as the default for the current platform
  static void registerWith() {
    LifecycleGuardPlatform.instance = MyNewPlatformGuard();
  }

  @override
  Future<void> runSecureTask({
    required String id,
    Map<String, dynamic>? payload,
  }) async {
    // 🛡️ Your platform-specific native logic goes here
    // e.g., Start a Windows Service or a Web Worker
    print("Starting secure task $id on the new platform...");
  }
}
```

---

## 📐 Architecture Overview
The platform interface acts as the middleman in the federated structure:

1.  **`lifecycle_guard`**: The app-facing package that developers use.
2.  **`lifecycle_guard_platform_interface`**: **(This package)** The glue/contract.
3.  **`lifecycle_guard_android / ios`**: The actual native workers.

---

## 📄 License
BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">
Built with ❤️ by [Crealify](https://anil-bhattarai.com.np)
</div>
