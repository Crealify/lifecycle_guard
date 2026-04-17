# lifecycle_guard

The app-facing package for the `lifecycle_guard` federated plugin.

This is the package that end-users import. It delegates all platform calls to the appropriate native implementation via `lifecycle_guard_platform_interface`.

## Usage

```dart
import 'package:lifecycle_guard/lifecycle_guard.dart';

await LifecycleGuard.runSecureTask(
  id: "sync_001",
  payload: {"retry": true},
);
```

## Documentation
Full documentation and demo at [github.com/Crealify/lifecycle_guard](https://github.com/Crealify/lifecycle_guard).
