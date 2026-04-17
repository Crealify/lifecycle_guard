import 'package:flutter_test/flutter_test.dart';
import 'package:lifecycle_guard/lifecycle_guard.dart';

void main() {
  test('runSecureTask exists', () {
    expect(LifecycleGuard.runSecureTask, isNotNull);
  });
}
