import 'package:flutter/material.dart';
import 'animation.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedLine(value: _formProgress),
          const Text(
            'Regisztráció',
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: const InputDecoration(
                label: Text(
                  "Vezetéknév",
                  style: TextStyle(
                    color: Color(0xFF787878),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: const InputDecoration(
                label: Text(
                  "Keresztnév",
                  style: TextStyle(
                    color: Color(0xFF787878),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: const InputDecoration(
                label: Text(
                  "Felhasználónév",
                  style: TextStyle(
                    color: Color(0xFF787878),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.black;
              }),
            ),
            onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            child: const Text(
              'Regisztráció',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
