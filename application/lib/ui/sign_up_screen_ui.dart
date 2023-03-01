import 'package:application/utils/input_box.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/my_button.dart';
import '../utils/styles.dart';
import '../utils/text_strings.dart';
import '../viewmodel/sign_up_screen_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isOrganizerUser = true;
  final signUpViewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.lightBlueColor,
        title: Text(
          signUp,
          style: Styles.textStyles,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputBox(
                      const Icon(
                        Icons.account_circle,
                      ),
                      fullName,
                    ),
                    InputBox(
                      const Icon(
                        Icons.account_circle,
                      ),
                      userName,
                    ),
                    InputBox(
                      const Icon(
                        Icons.mail,
                      ),
                      email,
                    ),
                    InputBox(
                      const Icon(
                        Icons.vpn_key,
                      ),
                      password,
                    ),
                    Text(
                      eventsChechBox,
                      style: Styles.textStyles,
                    ),
                    RadioListTile(
                      title: Text(radioTitleYes),
                      value: true,
                      groupValue: _isOrganizerUser,
                      onChanged: (value) {
                        setState(() {
                          _isOrganizerUser = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(radioTitleNo),
                      value: false,
                      groupValue: _isOrganizerUser,
                      onChanged: (value) {
                        setState(
                          () {
                            _isOrganizerUser = value!;
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: MyButton(logIn, () {
                        if (_formKey.currentState!.validate()) {
                          signUpViewModel.NavigateToSpecificHomeScreen(
                              _isOrganizerUser, context);
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
