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
    apiKey: 'AIzaSyDZtGesLOa9-aA60oHy0cNX2LBmbwa-rJw',
    appId: '1:523894060335:web:46b940160f15cd5ffeddda',
    messagingSenderId: '523894060335',
    projectId: 'flutterinstagramclone-98cde',
    authDomain: 'flutterinstagramclone-98cde.firebaseapp.com',
    storageBucket: 'flutterinstagramclone-98cde.appspot.com',
    measurementId: 'G-SCX4G0KQGW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTRebAqBG8NFYytEiB59cM5icgBxYtfnY',
    appId: '1:523894060335:android:ddceb9c021d7def5feddda',
    messagingSenderId: '523894060335',
    projectId: 'flutterinstagramclone-98cde',
    storageBucket: 'flutterinstagramclone-98cde.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDh_AZHENazdtBydQ981RfdkNjqS3CG0GA',
    appId: '1:523894060335:ios:5981eb5c81a1314ffeddda',
    messagingSenderId: '523894060335',
    projectId: 'flutterinstagramclone-98cde',
    storageBucket: 'flutterinstagramclone-98cde.appspot.com',
    iosClientId: '523894060335-19117gnsms2jpa2mhlclbnibuspdcbci.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterInstagramClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDh_AZHENazdtBydQ981RfdkNjqS3CG0GA',
    appId: '1:523894060335:ios:5981eb5c81a1314ffeddda',
    messagingSenderId: '523894060335',
    projectId: 'flutterinstagramclone-98cde',
    storageBucket: 'flutterinstagramclone-98cde.appspot.com',
    iosClientId: '523894060335-19117gnsms2jpa2mhlclbnibuspdcbci.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterInstagramClone',
  );
}
