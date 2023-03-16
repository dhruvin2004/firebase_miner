import 'package:firebase_miner/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : (context) => LoginPage(),
        'register' : (context) => RegisterPage(),
      },
    );
  }
}
