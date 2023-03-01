import 'package:application/utils/input_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<SignUpViewModel>(context);
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
                  children: <Widget>[
                    InputBox(
                      const Icon(
                        Icons.account_circle,
                      ),
                      fullName,
                      (name) => signUpViewModel.setname(name),
                      (value) => signUpViewModel.validateName(value!),
                    ),
                    InputBox(
                      const Icon(
                        Icons.account_circle,
                      ),
                      userName,
                      (userName) => signUpViewModel.setUserName(userName),
                      (value) => signUpViewModel.validateUserName(value!),
                    ),
                    InputBox(
                      const Icon(
                        Icons.mail,
                      ),
                      email,
                      (email) => signUpViewModel.setEmail(email),
                      (value) => signUpViewModel.validateEmail(value!),
                    ),
                    InputBox(
                      const Icon(
                        Icons.vpn_key,
                      ),
                      password,
                      (password) => signUpViewModel.setPassword(password),
                      (value) => signUpViewModel.validatePassword(value!),
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
                        signUpViewModel.setOrganizer(value!);
                        setState(() {
                          _isOrganizerUser = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(radioTitleNo),
                      value: false,
                      groupValue: _isOrganizerUser,
                      onChanged: (value) {
                        signUpViewModel.setOrganizer(value!);
                        setState(() {
                          _isOrganizerUser = value;
                        });
                      },
                    ),
                    if (signUpViewModel.error_messeges.isNotEmpty)
                      Text(
                        signUpViewModel.error_messeges.join(" "),
                        style: const TextStyle(color: Colors.red),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: MyButton(signUp, () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          await signUpViewModel.register();
                          if (_formKey.currentState!.validate()) {
                            signUpViewModel.NavigateToSpecificHomeScreen(
                                _isOrganizerUser, context);
                          }
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
