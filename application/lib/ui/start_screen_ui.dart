import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/image_strings.dart';
import '../utils/styles.dart';
import '../utils/text_strings.dart';
import '../utils/my_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
                left: 20, top: 250, right: 20, bottom: 90),
            child: Column(
              children: [
                Row(children: [
                  Image(
                    image: AssetImage(welcomeImage),
                    height: 160,
                  ),
                  Text(
                    appName,
                    style: Styles.welcomeApplicationNameStyle,
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    welcomeTitle,
                    style: Styles.welcomeTitleStyles,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    welcomeSubTitle,
                    style: Styles.welcomeSubTitleStyles,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: MyButton(signUp),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: MyButton(logIn),
                ),
              ],
            ),
          ),
        ));
  }
}
