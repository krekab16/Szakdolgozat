import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/image_strings.dart';
import '../utils/styles.dart';
import '../utils/text_strings.dart';
import '../utils/my_button_style.dart';

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
                const Padding(padding: EdgeInsets.all(10)),
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
                const Padding(padding: EdgeInsets.all(10)),
                MyButtonStyle(signUp),
                const Spacer(
                  flex: 2,
                ),
                MyButtonStyle(logIn),
              ],
            ),
          ),
        ));
  }
}
