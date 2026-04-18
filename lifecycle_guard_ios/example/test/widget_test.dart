import 'package:flutter_test/flutter_test.dart';
import 'package:lifecycle_guard_ios_example/main.dart';

void main() {
  testWidgets('Verify iOS Guard UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const IosGuardExampleApp());

    // Verify that we show the iOS branding
    expect(find.text('🛡️ iOS Lifecycle Guard'), findsOneWidget);
    expect(find.text('Schedule iOS Background Task'), findsOneWidget);
  });
}
