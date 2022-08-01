import 'package:demo_toctoc/presentation/auth_screen/login_screen/login_email_screen.dart';
import 'package:demo_toctoc/presentation/auth_screen/signup_screen/signup_screen.dart';
import 'package:demo_toctoc/resources/colors.dart';
import 'package:flutter/material.dart';

import '../../../resources/styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var loginSignupStyle = LoginSignupStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 80),
              child: Text(
                'Log in TocToc',
                style: loginSignupStyle.bigTitle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginEmailScreen()),
                );
              },
              child: Container(
                color: logButtonOption,
                height: 56,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.email),
                    ),
                    Text(
                      'Log in with Email',
                      style: loginSignupStyle.buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                color: logButtonOption,
                height: 56,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.g_mobiledata),
                    ),
                    Text(
                      'Continue with Google',
                      style: loginSignupStyle.buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: logButtonOption,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No account?',
              style: loginSignupStyle.bottomText,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text(
                'Sign up',
                style: loginSignupStyle.bottomTextClick,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
