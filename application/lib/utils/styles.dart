import 'package:flutter/material.dart';
import 'colors.dart';

class Styles {
  static const String handleeFont = 'Handlee';
  static const String robotoFont = 'Roboto';

  //a tehén melletti szöveg
  static const TextStyle nameStyles = TextStyle(
    fontFamily: handleeFont,
    color: MyColors.darkBlueColor,
    fontSize: 40,
  );

  static const TextStyle welcomeTitleStyles = TextStyle(
    fontFamily: robotoFont,
    color: MyColors.textColor,
    fontSize: 40,
  );

  static const TextStyle welcomeSubTitleStyles = TextStyle(
    fontFamily: robotoFont,
    color: MyColors.textColor,
    fontSize: 20,
  );

  static const TextStyle buttonStyles = TextStyle(
    fontFamily: robotoFont,
    fontSize: 17,
    color: MyColors.textColor,
  );

  static const TextStyle textStyles = TextStyle(
    fontFamily: robotoFont,
    color: MyColors.textColor,
  );

  static const TextStyle eventTitleStyles = TextStyle(
    fontFamily: robotoFont,
    fontSize: 20,
  );
}
