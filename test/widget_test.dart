// Minimal test to verify app builds without errors

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qikipay/main.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/firebase_core');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Mock the method channel to prevent platform calls
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'Firebase#initializeCore') {
        return [
          {
            'name': '[DEFAULT]',
            'options': {
              'apiKey': 'fakeApiKey',
              'appId': 'fakeAppId',
              'messagingSenderId': 'fakeSenderId',
              'projectId': 'fakeProjectId',
            },
            'pluginConstants': {},
          }
        ];
      }
      if (methodCall.method == 'Firebase#initializeApp') {
        return null;
      }
      return null;
    });
  });

  tearDownAll(() {
    channel.setMockMethodCallHandler(null);
  });

  testWidgets('App builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const QikiPayApp());
    expect(find.byType(QikiPayApp), findsOneWidget);
  });
}
