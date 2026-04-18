import 'package:flutter_test/flutter_test.dart';
import 'package:lifecycle_guard_android_example/main.dart';

void main() {
  testWidgets('Verify Android Guard UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AndroidGuardExampleApp());

    // Verify that we show the Android branding
    expect(find.text('🛡️ Android Lifecycle Guard'), findsOneWidget);
    expect(find.text('Start Android Protected Task'), findsOneWidget);
  });
}
