# lifecycle_guard_platform_interface

The platform interface package for [`lifecycle_guard`](https://pub.dev/packages/lifecycle_guard).

This package defines the abstract `LifecycleGuardPlatform` class that all platform-specific implementations must extend. This enables the federated plugin pattern used by the Flutter team.

## Usage

This package is not intended to be imported directly by end users.
Import `package:lifecycle_guard/lifecycle_guard.dart` instead.

If you're building a platform implementation, implement `LifecycleGuardPlatform`:

```dart
class MyPlatformLifecycleGuard extends LifecycleGuardPlatform {
  @override
  Future<void> startBackgroundSync(String taskId, Map<String, dynamic> data) async {
    // Platform-specific implementation
  }
}
```

## Repository
[github.com/Crealify/lifecycle_guard](https://github.com/Crealify/lifecycle_guard)
