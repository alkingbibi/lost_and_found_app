import 'package:flutter/material.dart';
import 'features/auth/login_page.dart';

void main() {
  // Catch Flutter runtime errors globally
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    runApp(ErrorApp(details.exceptionAsString()));
  };

  runApp(const LostAndFoundApp());
}

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
      home: const LoginPage(), // الصفحة الرئيسية
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
