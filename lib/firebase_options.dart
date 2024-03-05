// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
// / ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
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
    apiKey: 'AIzaSyCZxyBZQlvnlLkteij_Au8oKzN2IjCBeQQ',
    appId: '1:1009164629448:web:2c4ab792bfe25d61607cfd',
    messagingSenderId: '1009164629448',
    projectId: 'quizapp-34f4f',
    authDomain: 'quizapp-34f4f.firebaseapp.com',
    storageBucket: 'quizapp-34f4f.appspot.com',
    measurementId: 'G-7H04Z76YDR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDFT6vEmVmgVpv2aLnuHfpL3uvJNSODsE',
    appId: '1:1009164629448:android:e5c4f9ba31d05d59607cfd',
    messagingSenderId: '1009164629448',
    projectId: 'quizapp-34f4f',
    storageBucket: 'quizapp-34f4f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFJaddOt1-Spdk7FEtE2cdrJmBgN1wEII',
    appId: '1:1009164629448:ios:0951a674449aa879607cfd',
    messagingSenderId: '1009164629448',
    projectId: 'quizapp-34f4f',
    storageBucket: 'quizapp-34f4f.appspot.com',
    iosBundleId: 'com.example.firebaseQuizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFJaddOt1-Spdk7FEtE2cdrJmBgN1wEII',
    appId: '1:1009164629448:ios:924d26a3c46910ad607cfd',
    messagingSenderId: '1009164629448',
    projectId: 'quizapp-34f4f',
    storageBucket: 'quizapp-34f4f.appspot.com',
    iosBundleId: 'com.example.firebaseQuizApp.RunnerTests',
  );
}
