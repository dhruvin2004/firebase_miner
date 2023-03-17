import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_miner/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash' : (context) => SplashScreen(),
        'login' : (context) => LoginPage(),
        'register' : (context) => RegisterPage(),
      },
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacementNamed(context, 'login'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(style: FlutterLogoStyle.stacked,size: 200,),
      ),
    );
  }
}
