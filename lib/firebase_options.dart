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
    apiKey: 'AIzaSyAnOiNxeEsL4G2ca1ru_vk0WMq7wnbVUms',
    appId: '1:549307640466:web:86884eebcf5e73e65ed44b',
    messagingSenderId: '549307640466',
    projectId: 'task-10f54',
    authDomain: 'task-10f54.firebaseapp.com',
    storageBucket: 'task-10f54.appspot.com',
    measurementId: 'G-T5M7SNYX0K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAM11-HmCTn09th6JazmU4vs5P3pU8MRs8',
    appId: '1:549307640466:android:bc274a5ff9d516015ed44b',
    messagingSenderId: '549307640466',
    projectId: 'task-10f54',
    storageBucket: 'task-10f54.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCs-zyksFgVoVVwlB9Xc4sqj80VkVOd4c4',
    appId: '1:549307640466:ios:6d9179f42f9146275ed44b',
    messagingSenderId: '549307640466',
    projectId: 'task-10f54',
    storageBucket: 'task-10f54.appspot.com',
    iosBundleId: 'com.example.taskScheduler',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCs-zyksFgVoVVwlB9Xc4sqj80VkVOd4c4',
    appId: '1:549307640466:ios:11e6b6580e2cec565ed44b',
    messagingSenderId: '549307640466',
    projectId: 'task-10f54',
    storageBucket: 'task-10f54.appspot.com',
    iosBundleId: 'com.example.taskScheduler.RunnerTests',
  );
}
