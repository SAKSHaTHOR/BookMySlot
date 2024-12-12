// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      return FirebaseOptions(
        apiKey: dotenv.get('WEB_API_KEY', fallback: ''),
        appId: dotenv.get('WEB_APP_ID', fallback: ''),
        messagingSenderId: dotenv.get('WEB_MESSAGING_SENDER_ID', fallback: ''),
        projectId: dotenv.get('WEB_PROJECT_ID', fallback: ''),
        authDomain: dotenv.maybeGet('WEB_AUTH_DOMAIN'),
        storageBucket: dotenv.maybeGet('WEB_STORAGE_BUCKET'),
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return FirebaseOptions(
          apiKey: dotenv.get('ANDROID_API_KEY', fallback: ''),
          appId: dotenv.get('ANDROID_APP_ID', fallback: ''),
          messagingSenderId: dotenv.get('ANDROID_MESSAGING_SENDER_ID', fallback: ''),
          projectId: dotenv.get('ANDROID_PROJECT_ID', fallback: ''),
          storageBucket: dotenv.maybeGet('ANDROID_STORAGE_BUCKET'),
        );
      case TargetPlatform.iOS:
        return FirebaseOptions(
          apiKey: dotenv.get('IOS_API_KEY', fallback: ''),
          appId: dotenv.get('IOS_APP_ID', fallback: ''),
          messagingSenderId: dotenv.get('IOS_MESSAGING_SENDER_ID', fallback: ''),
          projectId: dotenv.get('IOS_PROJECT_ID', fallback: ''),
          storageBucket: dotenv.maybeGet('IOS_STORAGE_BUCKET'),
          iosBundleId: dotenv.get('IOS_BUNDLE_ID', fallback: ''),
        );
      case TargetPlatform.macOS:
        return FirebaseOptions(
          apiKey: dotenv.get('MACOS_API_KEY', fallback: ''),
          appId: dotenv.get('MACOS_APP_ID', fallback: ''),
          messagingSenderId: dotenv.get('MACOS_MESSAGING_SENDER_ID', fallback: ''),
          projectId: dotenv.get('MACOS_PROJECT_ID', fallback: ''),
          storageBucket: dotenv.maybeGet('MACOS_STORAGE_BUCKET'),
          iosBundleId: dotenv.get('MACOS_BUNDLE_ID', fallback: ''),
        );
      case TargetPlatform.windows:
        return FirebaseOptions(
          apiKey: dotenv.get('WINDOWS_API_KEY', fallback: ''),
          appId: dotenv.get('WINDOWS_APP_ID', fallback: ''),
          messagingSenderId: dotenv.get('WINDOWS_MESSAGING_SENDER_ID', fallback: ''),
          projectId: dotenv.get('WINDOWS_PROJECT_ID', fallback: ''),
          authDomain: dotenv.maybeGet('WINDOWS_AUTH_DOMAIN'),
          storageBucket: dotenv.maybeGet('WINDOWS_STORAGE_BUCKET'),
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Linux - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}
