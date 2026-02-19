import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'features/auth/login_page.dart';
import 'features/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // إذا حدث خطأ في Firebase
    runApp(ErrorApp('Firebase init error:\n$e'));
    return;
  }

  // Catch Flutter errors globally
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    runApp(ErrorApp(details.exceptionAsString()));
  };

  runApp(const LostAndFoundApp());
}

// التطبيق الرئيسي
class LostAndFoundApp extends StatelessWidget {
  const LostAndFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mafqoodati App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(), // يبدأ بالـ LoginPage
    );
  }
}

// شاشة عرض الأخطاء
class ErrorApp extends StatelessWidget {
  final String errorMessage;
  const ErrorApp(this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
