// Minimal test to verify app builds without errors

import 'package:flutter_test/flutter_test.dart';
import 'package:qikipay/main.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('App builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const QikiPayApp());
    expect(find.byType(QikiPayApp), findsOneWidget);
  });
}
