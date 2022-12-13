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
    apiKey: 'AIzaSyDvDmws-_PJR-vkGNvheklWm0w9LkotcJQ',
    appId: '1:744938158526:web:2ea03e9f782aed06fe61ef',
    messagingSenderId: '744938158526',
    projectId: 'calculadoraimc-51863',
    authDomain: 'calculadoraimc-51863.firebaseapp.com',
    storageBucket: 'calculadoraimc-51863.appspot.com',
    measurementId: 'G-6JM88ZY291',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwYsAyuCB2xCgpf1ISIQpwX0IT32oP6Hg',
    appId: '1:744938158526:android:1e56f784adc281bdfe61ef',
    messagingSenderId: '744938158526',
    projectId: 'calculadoraimc-51863',
    storageBucket: 'calculadoraimc-51863.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxwu_opTYV1PBdgIeCvtX4NA3INOLAbFk',
    appId: '1:744938158526:ios:954cc2a37a291513fe61ef',
    messagingSenderId: '744938158526',
    projectId: 'calculadoraimc-51863',
    storageBucket: 'calculadoraimc-51863.appspot.com',
    iosClientId: '744938158526-sfvn8oecs2vn49nbqu60salujt86dnvv.apps.googleusercontent.com',
    iosBundleId: 'org.edu.calculatorImc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAxwu_opTYV1PBdgIeCvtX4NA3INOLAbFk',
    appId: '1:744938158526:ios:954cc2a37a291513fe61ef',
    messagingSenderId: '744938158526',
    projectId: 'calculadoraimc-51863',
    storageBucket: 'calculadoraimc-51863.appspot.com',
    iosClientId: '744938158526-sfvn8oecs2vn49nbqu60salujt86dnvv.apps.googleusercontent.com',
    iosBundleId: 'org.edu.calculatorImc',
  );
}