import 'package:lifecycle_guard_platform_interface/lifecycle_guard_platform_interface.dart';

class LifecycleGuard {
  /// Start a mission-critical background task
  static Future<void> runSecureTask({
    required String id, 
    Map<String, dynamic>? payload
  }) {
    return LifecycleGuardPlatform.instance.startBackgroundSync(id, payload ?? {});
  }
}
