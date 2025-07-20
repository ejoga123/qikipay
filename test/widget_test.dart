// Minimal test to verify app builds without errors

import 'package:flutter_test/flutter_test.dart';
import 'package:qikipay/main.dart';

void main() {
  testWidgets('App builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const QikiPayApp());
    expect(find.byType(QikiPayApp), findsOneWidget);
  });
}
