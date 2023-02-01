import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/image_strings.dart';
import '../utils/styles.dart';
import '../utils/text_strings.dart';
import '../utils/button_style.dart';

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
                left: 50, top: 250, right: 50, bottom: 90),
            child: Column(
              children: [
                Row(children: [
                  Image(
                    image: AssetImage(welcomeImage),
                    height: 160,
                  ),
                  Text(
                    appName,
                    style: Styles.nameStyles,
                  ),
                ]),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  welcomeTitle,
                  style: Styles.welcomeTitleStyles,
                  textAlign: TextAlign.center,
                ),
                Text(
                  welcomeSubTitle,
                  style: Styles.welcomeSubTitleStyles,
                  textAlign: TextAlign.center,
                ),
                const Spacer(
                  flex: 2,
                ),
                MyButton(signUp),
                const Spacer(
                  flex: 2,
                ),
                MyButton(logIn),
              ],
            ),
          ),
        ));
  }
}
