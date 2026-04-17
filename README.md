# lifecycle_guard 🛡️

**Fix background app kills instantly.**

Stop losing critical data when Android or iOS aggressively kills your app. 
`lifecycle_guard` ensures your background tasks survive termination, system reboots, and battery optimizations.

---

## ✨ Features

✅ **Isolate Protection**: Boots a lightweight secondary engine for background tasks.
✅ **Android 15+ Ready**: Compliant with new `dataSync` Foreground Service requirements.
✅ **Zero Data Loss**: Ensures mission-critical syncs finish even if the user swipes the app away.
✅ **One-Click Setup**: Clean, static API for 30-second integration.
✅ **Native Stability**: Hardened Kotlin & Swift implementations.

## 🎬 Demo

👉 **App force-closed?** → **Lifecycle Guard kicks in** → **Task finishes successfully.**

*(Add GIF here — this is critical for installs)*

## ⚡ How It Works
1. Call `LifecycleGuard.runSecureTask()`
2. A transparent, professional notification appears (Android)
3. Your background logic executes in a protected environment
4. Task completes even if the UI process is terminated

## 🧠 Supported Scenarios (v1)
- 🚀 Mission-critical database syncs
- 🚀 Large file uploads/downloads
- 🚀 Real-time location tracking guards
- 🚀 Processing sensitive local data after app exit

## 💡 Example
❌ **The Problem**
User starts a sync → User swipes app away → **Task KILLED (Data lost)**

✅ **The Fix**
```dart
import 'package:lifecycle_guard/lifecycle_guard.dart';

void main() {
  LifecycleGuard.runSecureTask(
    id: "sync_001",
    payload: {"retry": true}
  );
}
```
**Result**: Sync survives the swipe and finishes in the background.

## 🎯 Why Lifecycle Guard?

Background execution in Flutter is often:
- Unreliable across different OS versions
- Easily killed by battery savers
- Hard to debug natively

`lifecycle_guard` turns:
❌ **Random app kills** ➡️ ✅ **Guaranteed background survival**

## ⚠️ Important
- Does not bypass OS security rules.
- Requires user-triggered calls.
- Designed for mission-critical tasks, not for persistent "vampire" background usage.

## 🛠️ Roadmap
- [ ] iOS Background Fetch auto-scheduler
- [ ] Linux/Windows support (Community PRs welcome!)
- [ ] AI-assisted battery budget optimizer

## 🤝 Contributing
Have a native edge case we should support?
Open an issue or submit a PR!

## ⭐ Support
If this saved your data (and your sanity), give it a star ⭐
It helps improve the tool for everyone.

---

## 🚀 DEMO SCRIPT (FOR YOUR GIF)

🎬 **DEMO FLOW (Record this in 20-30 seconds)**

1.  **Scene 1 — The Problem**: Start a long task in a demo app. **Swipe the app away** in the multitasking view.
2.  **Scene 2 — The Death**: Show the console logs stopping abruptly.
3.  **Scene 3 — The Guard**: Re-open the app, call `LifecycleGuard.runSecureTask()`.
4.  **Scene 4 — The Survival**: **Swipe the app away again.**
5.  **Scene 5 — Magic Moment**: Show the **Android Notification** ("🛡️ Lifecycle Guard Active") staying visible while the console logs continue to scroll!
6.  **Scene 6 — End**: Show the "✅ Sync Complete" log.

---
**Repository**: [github.com/Crealify/lifecycle_guard](https://github.com/Crealify/lifecycle_guard)
