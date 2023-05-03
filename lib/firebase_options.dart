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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyADll6x7Ux6EoPwidv9aIi9GzylcSRrHC4',
    appId: '1:393559693850:web:75a42664c7ebc9dfdfcfa3',
    messagingSenderId: '393559693850',
    projectId: 'parchapp-da312',
    authDomain: 'parchapp-da312.firebaseapp.com',
    storageBucket: 'parchapp-da312.appspot.com',
    measurementId: 'G-VDD8VYFH28',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDy8WX68P5ECIYAoidh789zmQN2vu4e_Aw',
    appId: '1:393559693850:android:2c8acaaab18cfa85dfcfa3',
    messagingSenderId: '393559693850',
    projectId: 'parchapp-da312',
    storageBucket: 'parchapp-da312.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOMbH1Ezko5TdDvOozIfwblZkkGWb9W-8',
    appId: '1:393559693850:ios:4c6f4227e3941c18dfcfa3',
    messagingSenderId: '393559693850',
    projectId: 'parchapp-da312',
    storageBucket: 'parchapp-da312.appspot.com',
    iosClientId: '393559693850-6jqrgfqmba52cdq3mppnv77ns0plnfnq.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelappui',
  );
}
