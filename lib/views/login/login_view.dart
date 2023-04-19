import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:logger/logger.dart';

import 'package:macro_global_task/theme/colors.dart';

import 'package:macro_global_task/widgets/task_text.dart';
import 'package:stacked/stacked.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (BuildContext context, LoginViewModel viewModel, Widget? _) {
        return Scaffold(
            backgroundColor: buttonTextColor,
            body: Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new ExactAssetImage('assets/login_logo.png'),
                fit: BoxFit.cover,
              )),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  TaskText(
                    text: "LOGIN",
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () async {
                      viewModel.googleLogin();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      viewModel.navigateToSignup();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TaskText(
                          text: "Do You want to Sign Up?",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TaskText(
                          text: "Sign Up".toUpperCase(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
