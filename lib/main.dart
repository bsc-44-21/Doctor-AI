import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:doctor_ai/screens/welcome.dart';
import 'package:doctor_ai/screens/signIn.dart';
import 'package:doctor_ai/screens/signUp.dart';
import 'package:doctor_ai/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔑 Initialize Supabase
  await Supabase.initialize(
    url: 'https://tgqmqilqfzdqyasdjjjw.supabase.co', //Project url (supabase)
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRncW1xaWxxZnpkcXlhc2Rqamp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5Nzc3NjgsImV4cCI6MjA3MzU1Mzc2OH0.0tyjXeMFhykk2YSVD1ZHb_r1BBhM_Qhjn_Rt2mCwdmQ', // Anon/public API key
  );

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
