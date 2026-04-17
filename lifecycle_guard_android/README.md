<div align="center">

# 🤖 lifecycle_guard_android

**The bulletproof Android implementation for mission-critical background execution.**

This package ensures your background tasks survive termination on Android devices using a robust Foreground Service architecture.

[![GitHub](https://img.shields.io/badge/GitHub-Crealify-181717?logo=github)](https://github.com/Crealify/lifecycle_guard)
[![pub version](https://img.shields.io/badge/pub-v1.0.0-blue?logo=dart)](https://pub.dev/packages/lifecycle_guard_android)
[![Platform](https://img.shields.io/badge/Platform-Android-green)](https://pub.dev/packages/lifecycle_guard)

</div>

---

## 🎬 Demo

<div align="center">
  <img src="https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/lifecycle_guard_plugin_demo.gif" width="100%" alt="lifecycle_guard Demo">
</div>

---

## ⚙️ Android Native Setup

For this plugin to work, you **must** add the following configuration to your `android/app/src/main/AndroidManifest.xml`.

### 1. Permissions
Add these permissions outside the `<application>` tag:

```xml
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_DATA_SYNC" />
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

### 2. Service Declaration
Add this inside the `<application>` tag:

```xml
<service
    android:name="com.crealify.lifecycle_guard_android.LifecycleService"
    android:foregroundServiceType="dataSync"
    android:exported="false">
</service>
```

---

## 🦾 Features (Android)
- **Android 15+ Compliance**: Uses the required `dataSync` service type.
- **Battery Optimization Override**: Helps tasks survive Doze Mode.
- **Swipe-to-Kill Protection**: The service stays alive even if the user swipes the app away from the multitasking view.

---

## 📄 License

BSD 3-Clause License — see [LICENSE](https://github.com/Crealify/lifecycle_guard/blob/main/LICENSE) for details.

---

<div align="center">

Built with ❤️ by [Crealify](https://anil-bhattarai.com.np)

</div>
