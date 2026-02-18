// lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform, kIsWeb;

    class DefaultFirebaseOptions {
        static FirebaseOptions get currentPlatform {
              if (kIsWeb) {
                      return web;
              }
                  switch (defaultTargetPlatform) {
                          case TargetPlatform.android:
                                  return android;
                                        case TargetPlatform.iOS:
                                                throw UnsupportedError(
                                                            'DefaultFirebaseOptions are not set for iOS yet.',
                                                );
                                                      case TargetPlatform.macOS:
                                                            case TargetPlatform.windows:
                                                                  case TargetPlatform.linux:
                                                                          throw UnsupportedError(
                                                                                      'DefaultFirebaseOptions are not supported for this platform.',
                                                                          );
                                                                                default:
                                                                                        throw UnsupportedError(
                                                                                                    'DefaultFirebaseOptions are not supported for this platform.',
                                                                                        );
                  }
        }

          static const FirebaseOptions web = FirebaseOptions(
                apiKey: 'AIzaSyCI9jgYvxew1LNdyBLoMUCVs0AZQaH_kok',
                    appId: '1:742530984804:web:ddca22db5dc9734d5ca871',
                        messagingSenderId: '742530984804',
                            projectId: 'mafqoodatiapp2026',
                                storageBucket: 'mafqoodatiapp2026.appspot.com',
          );

            static const FirebaseOptions android = FirebaseOptions(
                  apiKey: 'AIzaSyCI9jgYvxew1LNdyBLoMUCVs0AZQaH_kok',
                      appId: '1:742530984804:android:ddca22db5dc9734d5ca871',
                          messagingSenderId: '742530984804',
                              projectId: 'mafqoodatiapp2026',
                                  storageBucket: 'mafqoodatiapp2026.appspot.com',
            );
    }
