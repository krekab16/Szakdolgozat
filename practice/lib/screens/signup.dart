import 'package:flutter/material.dart';
import 'package:eventify/hasznos/sizes.dart';
import 'package:eventify/hasznos/text_strings.dart';
import 'package:eventify/hasznos/colors.dart';

void main() {
  runApp(const SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  String? answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightBlueColor,
          title: Text(
            signUp,
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
                                        fullName,
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
                              const SizedBox(height: 15.0,),
                              TextFormField(
                                decoration: InputDecoration(
                                  label: Text(
                                    userName,
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
                              const SizedBox(height: 15.0,),
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
                              const SizedBox(height: 15.0,),
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
                              const SizedBox(height: 15.0,),
                              TextFormField(
                                decoration: InputDecoration(
                                  label: Text(
                                    password2,
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
                              const SizedBox(height: 20.0,),
                             Text(
                                 eventsChechBox,
                               style: const TextStyle(
                                 fontSize: 18,
                                 fontFamily: 'Roboto'
                               ),
                             ),
                              const SizedBox(height: 15.0,),
                             Row(
                               children: [
                                 Radio(
                                   value: "igen",
                                   groupValue: answer,
                                   onChanged: (value){
                                     setState(() {
                                       answer = value.toString();
                                     });
                                   },
                                 ),
                                 const Text(
                                   "Igen",
                                   style: TextStyle(
                                     fontFamily: 'Roboto',
                                     color: textColor,
                                   ),
                                 ),
                                 const SizedBox(width: 105.0,),
                                 Radio(
                                   value: "nem",
                                   groupValue: answer,
                                   onChanged: (value){
                                     setState(() {
                                       answer = value.toString();
                                     });
                                   },
                                 ),
                                 const Text(
                                   "Nem",
                                   style: TextStyle(
                                     fontFamily: 'Roboto',
                                     color: textColor,
                                   ),
                                 ),
                             ],
                             ),

                              const SizedBox(height: 75.0,),
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
                                    ),
                                  ),
                                  child: Text(
                                    signUp.toUpperCase(),
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