import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
    );
  }
}
class StartScreen extends StatefulWidget {
  @override
  _StartScreen createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(59.0, 150.0, 55.0, 0.0),
          color: MyColors.backgroundColor,
          child: Column(
            children: [
              Row(
                  children:[
                    Image(
                      image: AssetImage(welcomeImage),
                      height: 160,
                    ),
                    const Text(
                      'eventify',
                      style: Styles.nameStyles,
                    ),
                  ]
              ),
            ],
          ),
        ),

      )

    );
  }
}