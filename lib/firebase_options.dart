// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyClaZsA8-JslR6adCjEN-W5EDaitz4qkB4',
    appId: '1:550398716292:web:4db5eabbcff9a4950c15d1',
    messagingSenderId: '550398716292',
    projectId: 'sample-1293a',
    authDomain: 'sample-1293a.firebaseapp.com',
    storageBucket: 'sample-1293a.appspot.com',
    measurementId: 'G-2TK0TQ351B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAY5FTCmKSoX6iBZCM8VAJZE65F-DiYUEU',
    appId: '1:550398716292:android:f55c8021551a86aa0c15d1',
    messagingSenderId: '550398716292',
    projectId: 'sample-1293a',
    storageBucket: 'sample-1293a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC681faTNx8T9BqOV-uJBRkRz8RVguhBI8',
    appId: '1:550398716292:ios:53152292f4989b4a0c15d1',
    messagingSenderId: '550398716292',
    projectId: 'sample-1293a',
    storageBucket: 'sample-1293a.appspot.com',
    iosBundleId: 'com.example.sample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC681faTNx8T9BqOV-uJBRkRz8RVguhBI8',
    appId: '1:550398716292:ios:6c76fa4d5d6e516f0c15d1',
    messagingSenderId: '550398716292',
    projectId: 'sample-1293a',
    storageBucket: 'sample-1293a.appspot.com',
    iosBundleId: 'com.example.sample.RunnerTests',
  );
}
