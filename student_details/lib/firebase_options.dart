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
    apiKey: 'AIzaSyDWP2jkBEgzrYMpDOjIE-3-xK2ysqVbw6g',
    appId: '1:352199373535:web:72266a1aba9fa5961d6f6a',
    messagingSenderId: '352199373535',
    projectId: 'student-details-app-c6330',
    authDomain: 'student-details-app-c6330.firebaseapp.com',
    storageBucket: 'student-details-app-c6330.appspot.com',
    measurementId: 'G-01PVL92ZWM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvRBoFZ0HMg-CfIAnQR72IY4cHnnos8GU',
    appId: '1:352199373535:android:0f35aa20264485361d6f6a',
    messagingSenderId: '352199373535',
    projectId: 'student-details-app-c6330',
    storageBucket: 'student-details-app-c6330.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlMzdkeAN8ayJhvHWgJHIvqYBnSzuMLx4',
    appId: '1:352199373535:ios:315a5cea37fbb5021d6f6a',
    messagingSenderId: '352199373535',
    projectId: 'student-details-app-c6330',
    storageBucket: 'student-details-app-c6330.appspot.com',
    iosBundleId: 'com.example.studentDetails',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlMzdkeAN8ayJhvHWgJHIvqYBnSzuMLx4',
    appId: '1:352199373535:ios:ee4c370474f8c9e41d6f6a',
    messagingSenderId: '352199373535',
    projectId: 'student-details-app-c6330',
    storageBucket: 'student-details-app-c6330.appspot.com',
    iosBundleId: 'com.example.studentDetails.RunnerTests',
  );
}