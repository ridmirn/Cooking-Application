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
    apiKey: 'AIzaSyBLUf4FYSJKH1wlQJF86ujddl8RS634qBI',
    appId: '1:485028582881:web:994392e0fac8aa3857aea0',
    messagingSenderId: '485028582881',
    projectId: 'example-cooking-flutter',
    authDomain: 'example-cooking-flutter.firebaseapp.com',
    storageBucket: 'example-cooking-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZeXVQcmHpQpAlWQclWdCDglcc7bRbEHQ',
    appId: '1:485028582881:android:d4ca9dffdd0faa9e57aea0',
    messagingSenderId: '485028582881',
    projectId: 'example-cooking-flutter',
    storageBucket: 'example-cooking-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBPdda46xOhnAa1jRkv_ZjqDq0bmBLa2Q',
    appId: '1:485028582881:ios:0b5d9f5890d29c7757aea0',
    messagingSenderId: '485028582881',
    projectId: 'example-cooking-flutter',
    storageBucket: 'example-cooking-flutter.appspot.com',
    iosClientId: '485028582881-j5pfiqotpgvs9b10bp38522a5fp1uja8.apps.googleusercontent.com',
    iosBundleId: 'com.example.newflutterproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBPdda46xOhnAa1jRkv_ZjqDq0bmBLa2Q',
    appId: '1:485028582881:ios:5f411d7343be3a4f57aea0',
    messagingSenderId: '485028582881',
    projectId: 'example-cooking-flutter',
    storageBucket: 'example-cooking-flutter.appspot.com',
    iosClientId: '485028582881-b6s9sj7sc904su1cq61e67vq13tilibh.apps.googleusercontent.com',
    iosBundleId: 'com.example.newflutterproject.RunnerTests',
  );
}
