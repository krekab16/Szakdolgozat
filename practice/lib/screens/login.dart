import 'package:flutter/material.dart';
import 'package:eventify/hasznos/sizes.dart';
import 'package:eventify/hasznos/text_strings.dart';
import 'package:eventify/hasznos/colors.dart';

void main() {
  runApp(const LogIn());
}


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogIn();
}

class _LogIn extends State<LogIn> {
  bool? check = true;

@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightBlueColor,
          title: Text(
            logIn,
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: textColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: formHeight),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                email,
                                style: const TextStyle(
                                  color:labelTextColor,
                                ),
                              ),
                              border: const OutlineInputBorder(),
                              labelStyle: const TextStyle(color: textColor),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 2.5, color: textColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25.0,),
                          TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                password,
                                style: const TextStyle(
                                  color:labelTextColor,
                                ),
                              ),
                              border: const OutlineInputBorder(),
                              labelStyle: const TextStyle(color: textColor),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 2.5, color: textColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25.0,),
                          Row(
                            children: [
                              Checkbox(
                                  value: check, //set variable for value
                                  onChanged: (bool? value){
                                    setState(() {
                                      check = value;
                                    });
                                  },
                              ),
                              Text(
                                  rememberMe,
                                  style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: textColor,
                                ),
                              ),
                              const SizedBox(width: 35.0,),
                              Text(
                                forgetPassword,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: labelTextColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 280.0,),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){},
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
                          )
                        ],
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
      );
  }
}