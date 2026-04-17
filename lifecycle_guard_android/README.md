<div align="center">

# 🛡️ lifecycle_guard_android

**The Android implementation for mission-critical background execution.**

This package provides the Android-specific implementation of `lifecycle_guard`. It utilizes a robust Foreground Service with `dataSync` type to ensure tasks survive app termination and system optimizations.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v0.0.1-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard_android)
[![License: BSD-3](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.3.0-02569B?logo=flutter)](https://flutter.dev)

</div>

---

## 🎬 Demo

<div align="center">
  <img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/lifecycle_guard_plugin_demo.gif" width="100%" alt="lifecycle_guard Demo">
  <p><i>Watch the Android Foreground Service protect your background tasks.</i></p>
</div>

---

## 🤖 Android Specifics

- **Foreground Service**: Runs a persistent service to keep the process alive.
- **Android 15+ Ready**: Fully compliant with `foregroundServiceType="dataSync"`.
- **Notification**: Requires a persistent notification as per Android OS standards.

---

## 🚀 Usage

This is an **Implementation** package. App developers should use the main [lifecycle_guard](https://pub.dev/packages/lifecycle_guard) package.

---

## 📄 License

BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">

Built with ❤️ by [Crealify](https://github.com/Crealify) · Open to collaborate · PRs welcome

</div>

