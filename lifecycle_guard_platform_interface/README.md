<div align="center">

<img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png" width="120" alt="lifecycle_guard Logo">

# lifecycle_guard_platform_interface

**The common interface contract for mission-critical background execution.**

This package defines the glue that holds `lifecycle_guard` together across all platforms.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v1.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard_platform_interface)

</div>

---

## 🚀 Purpose

This is a **Platform Interface** package as defined by the [Federated Plugins](https://flutter.dev/to/federated-plugins) architecture.

It defines the `LifecycleGuardPlatform` abstract class that all platform-specific implementations (like `lifecycle_guard_android` and `lifecycle_guard_ios`) must implement.

### Why separate the interface?
1. **Strong Typing**: Ensures all platforms follow the exact same API.
2. **Extensibility**: Community members can add support for Windows, Linux, or Web just by implementing this interface.
3. **Stability**: Changes to the main app-facing package don't break the native implementations.

---

## 🛠️ For Contributors

If you want to add support for a new platform:
1. Create a new package (e.g., `lifecycle_guard_windows`).
2. Depend on this package.
3. Extend `LifecycleGuardPlatform`.
4. Register your implementation.

---

## 📄 License

BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">

Built with ❤️ by [Crealify](https://anil-bhattarai.com.np)

</div>

