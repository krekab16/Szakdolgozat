import 'package:flutter/material.dart';
import 'form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: SizedBox(
          width: 330,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
