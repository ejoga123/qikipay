// Minimal test to verify app builds without errors

import 'package:flutter_test/flutter_test.dart';
import 'package:qikipay/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('App builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const QikiPayApp());
    expect(find.byType(QikiPayApp), findsOneWidget);
  });
}
