import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child:
            Text(
                'Üdvözöllek!',
                style: TextStyle (
                  color: Colors.pink,
                  fontSize: 70,
                ),
            ),
      ),
    );
  }
}
