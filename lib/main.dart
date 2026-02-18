import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/auth/login_page.dart';
import 'features/home/home_page.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
      );
        runApp(LostAndFoundApp());
}

class LostAndFoundApp extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
            return MaterialApp(
                    title: 'Mafqoodati App',
                          debugShowCheckedModeBanner: false,
                                theme: ThemeData(
                                          primarySwatch: Colors.deepPurple,
                                ),
                                      home: LoginPage(),
            );
      }
}
