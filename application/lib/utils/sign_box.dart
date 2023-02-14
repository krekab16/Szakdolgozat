import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SignBox extends StatelessWidget {
  final Widget fieldIcon;
  final String fieldText;

  const SignBox(this.fieldIcon, this.fieldText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (value) {},
        decoration: InputDecoration(
          prefixIcon: fieldIcon,
          label: Text(
            fieldText,
            style: const TextStyle(
              color: Color(0xFF787878),
            ),
          ),
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(color: MyColors.textColor),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: MyColors.darkBlueColor),
          ),
        ),
      ),
    );
  }
}
