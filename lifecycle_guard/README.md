<div align="center">

# 🛡️ lifecycle_guard

**The bulletproof Flutter plugin for mission-critical background execution.**

Stop losing data when Android or iOS aggressively kills your app.
`lifecycle_guard` ensures your background tasks survive termination, system reboots, and battery optimizations — guaranteed.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v0.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard)
[![License: BSD-3](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.3.0-02569B?logo=flutter)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)](#platform-support)

</div>

---

## 🎬 Demo

<div align="center">
  <img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/lifecycle_guard_plugin_demo.gif" width="100%" alt="lifecycle_guard Demo">
  <p><i>Watch lifecycle_guard in action: App swipe → Background survival → Task completion.</i></p>
</div>

---

## ✨ Features

| Feature | Description |
|---|---|
| 🛡️ **Isolate Protection** | Boots a lightweight secondary engine so your task never shares the UI thread fate |
| 🤖 **Android 15+ Ready** | Fully compliant with new `foregroundServiceType: dataSync` requirements |
| 🍎 **iOS Compatible** | Bridges to Apple's native background task scheduler |
| 📡 **Zero Data Loss** | Tasks continue even when users swipe the app away |
| ⚡ **30-Second Setup** | One-line API — no complex native configuration needed |

---

## 🚀 Quick Start

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  lifecycle_guard: ^0.0.1
```

### Usage

```dart
import 'package:lifecycle_guard/lifecycle_guard.dart';

// Trigger a mission-critical background task
await LifecycleGuard.runSecureTask(
  id: "sync_user_data",
  payload: {"userId": "12345"},
);
```

---

## 🧠 How It Works

`lifecycle_guard` uses a federated architecture to boot a native protected service (Android Foreground Service or iOS Background Task) that runs independently of your app's UI lifecycle.

Full technical details and architecture diagrams at [GitHub](https://github.com/Crealify/lifecycle_guard).

---

## 📄 License

BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">

Built with ❤️ by [Crealify](https://github.com/Crealify) · Open to collaborate · PRs welcome

</div>
