import 'package:flutter/material.dart';
import 'package:eventify/screens/login.dart';
import 'package:eventify/screens/signup.dart';
import 'package:eventify/hasznos/sizes.dart';
import 'package:eventify/hasznos/text_strings.dart';
import 'package:eventify/hasznos/colors.dart';
import 'package:eventify/hasznos/image_strings.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(59.0, 150.0, 55.0, 0.0),
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
                children:[
                  Image(
                    image: AssetImage(welcomeImage),
                    height: 160,
                  ),
                  Text(
                    appName,
                    style: const TextStyle(
                      fontFamily: 'Handlee',
                      color: darkBlueColor,
                      fontSize: 35,

                    ),
                  ),
                ]
            ),
            Text(
              welcomeTitle,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              welcomeSubTitle,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: lightBlueColor,
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: Size(buttonWidth, buttonHeight),
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: textColor,
                    ),
                  ),
                  child: Text(
                    signUp.toUpperCase(),
                    style: const TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 25.0,),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: lightBlueColor,
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: Size(buttonWidth, buttonHeight),
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: textColor,
                    ),
                  ),
                  child: Text(
                    logIn.toUpperCase(),
                    style: const TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}