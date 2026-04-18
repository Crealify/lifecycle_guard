import 'package:lifecycle_guard_platform_interface/lifecycle_guard_platform_interface.dart';

class LifecycleGuard {
  /// Start a mission-critical background task.
  /// 
  /// The [id] should be a unique identifier for the task.
  /// The [payload] can contain any additional data needed by the task.
  static Future<void> runSecureTask({
    required String id, 
    Map<String, dynamic>? payload
  }) {
    return LifecycleGuardPlatform.instance.runSecureTask(
      id: id, 
      payload: payload
    );
  }

  /// Stop the secure task and release native resources.
  /// 
  /// Call this once your critical work is complete to stop the
  /// Android Foreground Service or end the iOS background task window.
  static Future<void> stopSecureTask() {
    return LifecycleGuardPlatform.instance.stopSecureTask();
  }
}
