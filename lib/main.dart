import 'package:flutter/material.dart';
import 'package:doctor_ai/screens/welcome.dart';
import 'package:doctor_ai/screens/signIn.dart';
import 'package:doctor_ai/screens/signUp.dart';
import 'package:doctor_ai/screens/home.dart';

void main() {
  runApp(const DoctorAIApp());
}

class DoctorAIApp extends StatelessWidget {
  const DoctorAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor AI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // Start at the WelcomeScreen
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signIn': (context) => const SignInScreen(),
        '/signUp': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
