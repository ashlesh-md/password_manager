import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:password_manager/screens/home.dart';
import 'package:password_manager/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 11, 11, 11),
      ),
      home: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(70, 184, 252, 1),
              Color.fromRGBO(30, 136, 252, 1),
            ])),
        child: AnimatedSplashScreen(
          backgroundColor: Colors.transparent,
          nextScreen: const Home(),
          splash: 'assets/Images/01/logo.png',
          splashIconSize: 250,
          splashTransition: SplashTransition.fadeTransition,
          duration: 5000,
        ),
      ),
      routes: routes,
    );
  }
}
