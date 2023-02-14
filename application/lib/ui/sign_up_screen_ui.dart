import 'package:application/utils/sign_box.dart';
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
  bool _radioValue = true;
  final viewModel = SignUpViewModel();

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
                    SignBox(
                      const Icon(
                        Icons.account_circle,
                      ),
                      fullName,
                    ),
                    SignBox(
                      const Icon(
                        Icons.account_circle,
                      ),
                      userName,
                    ),
                    SignBox(
                      const Icon(
                        Icons.mail,
                      ),
                      email,
                    ),
                    SignBox(
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
                      title: const Text('Igen'),
                      value: true,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Nem'),
                      value: false,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(
                          () {
                            _radioValue = value!;
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: MyButton(logIn, () {
                        if (_formKey.currentState!.validate()) {
                          if (viewModel.navigateToAdminHome) {
                            Navigator.pushNamed(context, '/admin_home');
                          } else if (viewModel.navigateToHome) {
                            Navigator.pushNamed(context, '/home');
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
