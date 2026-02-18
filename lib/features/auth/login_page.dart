import 'package:flutter/material.dart';
import 'register_page.dart';
import '../home/home_page.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
    @override
      _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final emailController = TextEditingController();
      final passwordController = TextEditingController();
        final auth = FirebaseAuth.instance;

          void login() async {
                try {
                        await auth.signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                          password: passwordController.text.trim(),
                        );
                              Navigator.pushReplacement(
                                        context,
                                                MaterialPageRoute(builder: (_) => HomePage()),
                              );
                } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error: ${e.toString()}')),
                        );
                }
          }

            @override
              Widget build(BuildContext context) {
                    return Scaffold(
                            body: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                              child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                                  CustomTextField(controller: emailController, hint: 'Email'),
                                                                                              SizedBox(height: 20),
                                                                                                          CustomTextField(controller: passwordController, hint: 'Password', obscureText: true),
                                                                                                                      SizedBox(height: 20),
                                                                                                                                  CustomButton(text: 'Login', onPressed: login),
                                                                                                                                              TextButton(
                                                                                                                                                              onPressed: () => Navigator.push(
                                                                                                                                                                                  context, MaterialPageRoute(builder: (_) => RegisterPage())),
                                                                                                                                                                                                child: Text('Create Account'),
                                                                                                                                              ),
                                                                    ],
                                              ),
                            ),
                    );
              }
}
