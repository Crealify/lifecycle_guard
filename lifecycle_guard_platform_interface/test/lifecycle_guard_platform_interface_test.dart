import 'package:flutter_test/flutter_test.dart';
import 'package:lifecycle_guard_platform_interface/lifecycle_guard_platform_interface.dart';

void main() {
  test('default instance is MethodChannelLifecycleGuard', () {
    expect(LifecycleGuardPlatform.instance, isA<MethodChannelLifecycleGuard>());
  });
}
