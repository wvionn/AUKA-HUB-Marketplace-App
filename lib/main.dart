import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const AukaHubApp());
}

class AukaHubApp extends StatelessWidget {
  const AukaHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AukaHub Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // Font yang digunakan terlihat seperti Poppins atau sejenisnya
        fontFamily: 'Montserrat', 
      ),
      home: const LoginScreen(),
    );
  }
}