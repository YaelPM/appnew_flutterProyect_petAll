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
    apiKey: 'AIzaSyD7BjOuxGTUwSNljyRAu29-hMLhiMDM3wo',
    appId: '1:814377801839:web:bb0848a1abb18159db559a',
    messagingSenderId: '814377801839',
    projectId: 'appnew-1234',
    authDomain: 'appnew-1234.firebaseapp.com',
    storageBucket: 'appnew-1234.appspot.com',
    measurementId: 'G-7SR1SF3FQV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrAAGZziVAAZuuIURXJ37VUbO1pg0dmYk',
    appId: '1:814377801839:android:f65f4fe4c19e92abdb559a',
    messagingSenderId: '814377801839',
    projectId: 'appnew-1234',
    storageBucket: 'appnew-1234.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcgz5On8yE5qwpLV1HM4j3cB9DStmxVtc',
    appId: '1:814377801839:ios:5f7b1d59309f078fdb559a',
    messagingSenderId: '814377801839',
    projectId: 'appnew-1234',
    storageBucket: 'appnew-1234.appspot.com',
    iosClientId: '814377801839-8d28rpvn133hl35uo829n9i6e91a67it.apps.googleusercontent.com',
    iosBundleId: 'com.example.appNew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcgz5On8yE5qwpLV1HM4j3cB9DStmxVtc',
    appId: '1:814377801839:ios:5f7b1d59309f078fdb559a',
    messagingSenderId: '814377801839',
    projectId: 'appnew-1234',
    storageBucket: 'appnew-1234.appspot.com',
    iosClientId: '814377801839-8d28rpvn133hl35uo829n9i6e91a67it.apps.googleusercontent.com',
    iosBundleId: 'com.example.appNew',
  );
}