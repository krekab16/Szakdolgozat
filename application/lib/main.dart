import 'package:application/ui/log_in_screen_ui.dart';
import 'package:application/ui/sign_up_screen_ui.dart';
import 'package:application/ui/start_screen_ui.dart';
import 'package:application/utils/route_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eventify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartScreen(),
      routes: {
        startRoute : (context) => const StartScreen(),
        signUpRoute : (context) => const SignUpScreen(),
        logInRoute : (context) => const LogInScreen(),
      },
    );
  }
}
