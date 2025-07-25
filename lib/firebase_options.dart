// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDXDhM2KnOk93-cXF-qGiESCWncV4Hvp48',
    appId: '1:353705145888:web:b5dfc2f111f836b91fee45',
    messagingSenderId: '353705145888',
    projectId: 'qikipay',
    authDomain: 'qikipay.firebaseapp.com',
    storageBucket: 'qikipay.firebasestorage.app',
    measurementId: 'G-R1TVQ1R8WQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWYBW5otODz9hAPfD6RH_m1KS4vFCq_WY',
    appId: '1:353705145888:android:7de9c17af3b0ed4a1fee45',
    messagingSenderId: '353705145888',
    projectId: 'qikipay',
    storageBucket: 'qikipay.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCw3XKrBK7dz7Gdg22rQZqrLaWZMWfFvqY',
    appId: '1:353705145888:ios:80d882d096bbb4e51fee45',
    messagingSenderId: '353705145888',
    projectId: 'qikipay',
    storageBucket: 'qikipay.firebasestorage.app',
    iosBundleId: 'com.example.qikipay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCw3XKrBK7dz7Gdg22rQZqrLaWZMWfFvqY',
    appId: '1:353705145888:ios:80d882d096bbb4e51fee45',
    messagingSenderId: '353705145888',
    projectId: 'qikipay',
    storageBucket: 'qikipay.firebasestorage.app',
    iosBundleId: 'com.example.qikipay',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDXDhM2KnOk93-cXF-qGiESCWncV4Hvp48',
    appId: '1:353705145888:web:874d00f080e879591fee45',
    messagingSenderId: '353705145888',
    projectId: 'qikipay',
    authDomain: 'qikipay.firebaseapp.com',
    storageBucket: 'qikipay.firebasestorage.app',
    measurementId: 'G-GTL1PCJHF9',
  );
}
