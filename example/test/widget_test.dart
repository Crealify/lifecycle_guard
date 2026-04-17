import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const LifecycleGuardDemoApp());
    expect(find.text('lifecycle_guard'), findsOneWidget);
  });
}
