import 'package:application/utils/styles.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class MyButton extends StatelessWidget {
  final String reg;

  const MyButton(this.reg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: MyColors.lightBlueColor,
              padding: const EdgeInsets.all(5.0),
            ),
            child: Text(
              reg.toUpperCase(),
              style: Styles.buttonStyles,
            ),
          ),
        ));
  }
}
