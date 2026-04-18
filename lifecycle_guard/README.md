<div align="center">

<img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png" width="160" alt="lifecycle_guard Logo">

# lifecycle_guard

**The bulletproof Flutter plugin for mission-critical background execution.**

Stop losing data when Android or iOS aggressively kills your app.
`lifecycle_guard` ensures your background tasks survive termination, system reboots, and battery optimizations — guaranteed.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v1.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard)
[![License: BSD-3](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.3.0-02569B?logo=flutter)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)](#platform-support)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Crealify/lifecycle_guard/blob/main/CONTRIBUTING.md)

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
| 🔐 **User-Safe** | No auto-execution, no hidden scripts, everything is user-triggered |

---

## 🚀 Quick Start

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  lifecycle_guard: ^1.0.1
```

### ⚙️ Platform-Specific Setup

For production use, you **must** configure the native layer for each platform. Click below for detailed guides:

| Platform | Setup Guide | Key Requirements |
|---|---|---|
| **Android** | [Android Guide](https://pub.dev/packages/lifecycle_guard_android) | Manifest Service, Notification Permissions |
| **iOS** | [iOS Guide](https://pub.dev/packages/lifecycle_guard_ios) | Background Modes, Task Identifiers |
| **Common** | [Interface Docs](https://pub.dev/packages/lifecycle_guard_platform_interface) | Internal Contract Details |

---

## 💡 Usage

```dart
import 'package:lifecycle_guard/lifecycle_guard.dart';

// Trigger a mission-critical background task
await LifecycleGuard.runSecureTask(
  id: "sync_user_data",
  payload: {
    "userId": "12345",
    "retry": true,
    "timestamp": DateTime.now().toIso8601String(),
  },
);
```

---

## 🧠 How It Works

```mermaid
graph TD
    subgraph App ["📱 Flutter Application"]
        A["<b>runSecureTask()</b><br/><i>Initiate critical task</i>"]
    end

    subgraph Bridge ["🌉 Platform Bridge"]
        B{"OS Detection"}
    end

    subgraph Guard ["🛡️ Lifecycle Guard Layer"]
        subgraph Android ["🤖 Android"]
            C["<b>LifecycleService</b><br/><i>Foreground + dataSync</i>"]
        end
        subgraph iOS ["🍎 iOS"]
            D["<b>BGTaskScheduler</b><br/><i>BGProcessingTask</i>"]
        end
    end

    subgraph Survival ["🚀 Survival Matrix"]
        E["✅ App Swipe Survival"]
        F["✅ Doze Mode Protection"]
        G["✅ Battery Save Compliance"]
    end

    A --> B
    B -- "Android 15+" --> C
    B -- "iOS 13+" --> D
    
    C --> Survival
    D --> Survival

    %% Styling
    style App fill:#0D47A1,color:#fff,stroke:#fff,stroke-width:2px
    style Bridge fill:#37474F,color:#fff,stroke:#fff,stroke-width:2px
    style Android fill:#1B5E20,color:#fff,stroke:#fff,stroke-width:2px
    style iOS fill:#000,color:#fff,stroke:#fff,stroke-width:2px
    style Survival fill:#1B1F23,color:#3fb950,stroke:#3fb950,stroke-width:2px
```

---

## 📄 License

BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">

Built with ❤️ by [Crealify](https://anil-bhattarai.com.np) · Open to collaborate · PRs welcome

</div>

