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
    apiKey: 'AIzaSyCMBhGb8vNEEs2X0sAhVkHkRixWKo0KCRs',
    appId: '1:924809309420:web:292e8b473745adf86009c9',
    messagingSenderId: '924809309420',
    projectId: 'fir-auth-p2-ed55d',
    authDomain: 'fir-auth-p2-ed55d.firebaseapp.com',
    storageBucket: 'fir-auth-p2-ed55d.appspot.com',
    measurementId: 'G-3XTTFB22EX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMWJk1IAnXvRIJTA9hLCQlWDUHA4bVP4U',
    appId: '1:924809309420:android:d26431d27becd3c26009c9',
    messagingSenderId: '924809309420',
    projectId: 'fir-auth-p2-ed55d',
    storageBucket: 'fir-auth-p2-ed55d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAg_pwFJ9FQfkKQlHHPMpXCIr3swzFYEXM',
    appId: '1:924809309420:ios:bec56ff5816c8fb46009c9',
    messagingSenderId: '924809309420',
    projectId: 'fir-auth-p2-ed55d',
    storageBucket: 'fir-auth-p2-ed55d.appspot.com',
    iosClientId: '924809309420-lvib8sgr66t2jju0nkfmtkoape11lqdm.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthP2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAg_pwFJ9FQfkKQlHHPMpXCIr3swzFYEXM',
    appId: '1:924809309420:ios:c88d20f9801cb2696009c9',
    messagingSenderId: '924809309420',
    projectId: 'fir-auth-p2-ed55d',
    storageBucket: 'fir-auth-p2-ed55d.appspot.com',
    iosClientId: '924809309420-rp6qtjtesi1pa95n1n809m47oik04m1f.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthP2.RunnerTests',
  );
}
