import 'package:lifecycle_guard_platform_interface/lifecycle_guard_platform_interface.dart';

class LifecycleGuardAndroid extends MethodChannelLifecycleGuard {
  static void registerWith() {
    LifecycleGuardPlatform.instance = LifecycleGuardAndroid();
  }
}
