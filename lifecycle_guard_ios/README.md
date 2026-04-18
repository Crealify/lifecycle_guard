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

## 🎬 Demo

<div align="center">
  <img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/lifecycle_guard_plugin_demo.gif" width="100%" alt="lifecycle_guard Demo">
</div>

---

## ⚙️ iOS Native Setup

To allow background execution on iOS, you must configure your `Info.plist` and app capabilities.

### 1. Enable Background Modes
In Xcode, go to **Signing & Capabilities** -> **+ Capability** -> **Background Modes**.
Check the following:
- `Background fetch`
- `Background processing`

### 2. Info.plist Configuration
Add the following keys to your `ios/Runner/Info.plist`:

```xml
<key>BGTaskSchedulerPermittedIdentifiers</key>
<array>
    <string>com.crealify.lifecycle_guard.background_task</string>
</array>
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

