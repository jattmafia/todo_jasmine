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
    apiKey: 'AIzaSyDD-uprhsXmW6vd07AIyOSrRqM7j-uR46U',
    appId: '1:363059414530:web:f408a47c0bfcb3c904491b',
    messagingSenderId: '363059414530',
    projectId: 'todo-firebase-38ae9',
    authDomain: 'todo-firebase-38ae9.firebaseapp.com',
    storageBucket: 'todo-firebase-38ae9.appspot.com',
    measurementId: 'G-QJ7DBKNBFK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNxCgAox2dXZXn_UXJlnQt2vgp6o95f6Q',
    appId: '1:363059414530:android:2431a60ff1bb8d1c04491b',
    messagingSenderId: '363059414530',
    projectId: 'todo-firebase-38ae9',
    storageBucket: 'todo-firebase-38ae9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhk9EsgBn6Hung27iXYhTxBefag0NZH5A',
    appId: '1:363059414530:ios:3dda37a78154977b04491b',
    messagingSenderId: '363059414530',
    projectId: 'todo-firebase-38ae9',
    storageBucket: 'todo-firebase-38ae9.appspot.com',
    iosClientId: '363059414530-s7rr0cve0ihhmgqilsib26c1bmv4cv39.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhk9EsgBn6Hung27iXYhTxBefag0NZH5A',
    appId: '1:363059414530:ios:3dda37a78154977b04491b',
    messagingSenderId: '363059414530',
    projectId: 'todo-firebase-38ae9',
    storageBucket: 'todo-firebase-38ae9.appspot.com',
    iosClientId: '363059414530-s7rr0cve0ihhmgqilsib26c1bmv4cv39.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApplication',
  );
}