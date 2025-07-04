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
    apiKey: 'AIzaSyCzT07mHe7y87r1ZLw0SV9raxlNdpY9N84',
    appId: '1:739889729164:web:51bbd437d3646f5c07f5a9',
    messagingSenderId: '739889729164',
    projectId: 'e-commerce-app-e6186',
    authDomain: 'e-commerce-app-e6186.firebaseapp.com',
    storageBucket: 'e-commerce-app-e6186.firebasestorage.app',
    measurementId: 'G-MCTPFPPN50',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvEiYwvFLyz_CE_7mucvSzbpfhy2TygV8',
    appId: '1:739889729164:android:1b5d2cd23fc5b33807f5a9',
    messagingSenderId: '739889729164',
    projectId: 'e-commerce-app-e6186',
    storageBucket: 'e-commerce-app-e6186.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFdqyhLlTac-VcT-yewzNlYT5u9l_Trig',
    appId: '1:739889729164:ios:530bd40a93b48ea607f5a9',
    messagingSenderId: '739889729164',
    projectId: 'e-commerce-app-e6186',
    storageBucket: 'e-commerce-app-e6186.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFdqyhLlTac-VcT-yewzNlYT5u9l_Trig',
    appId: '1:739889729164:ios:530bd40a93b48ea607f5a9',
    messagingSenderId: '739889729164',
    projectId: 'e-commerce-app-e6186',
    storageBucket: 'e-commerce-app-e6186.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCzT07mHe7y87r1ZLw0SV9raxlNdpY9N84',
    appId: '1:739889729164:web:c6d46eb4eae306d707f5a9',
    messagingSenderId: '739889729164',
    projectId: 'e-commerce-app-e6186',
    authDomain: 'e-commerce-app-e6186.firebaseapp.com',
    storageBucket: 'e-commerce-app-e6186.firebasestorage.app',
    measurementId: 'G-0Q784Z0XSH',
  );
}
