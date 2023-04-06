import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/my_button.dart';
import '../utils/styles.dart';
import '../utils/text_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.lightBlueColor,
        title: Text(
          profile,
          style: Styles.textStyles,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(labelText: fullName),
                enabled: true,
                controller: TextEditingController(text: fullName),
                onChanged: (value) {},
              ),
              TextField(
                decoration: InputDecoration(labelText: userName),
                enabled: true,
                controller: TextEditingController(text: userName),
                onChanged: (value) {},
              ),
              TextField(
                decoration: InputDecoration(labelText: password),
                enabled: true,
                controller: TextEditingController(text: password),
                onChanged: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: MyButton(save, () {}),
              ),
            ],
          )),
    );
  }
}
