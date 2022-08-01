import 'package:demo_toctoc/presentation/auth_screen/signup_screen/signup_userid_screen.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class SignupPasswordScreen extends StatefulWidget {
  final TextEditingController emailController;
  SignupPasswordScreen(this.emailController, {Key? key}) : super(key: key);

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  var loginSignupStyle = LoginSignupStyle();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: black,
        ),
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'Enter your password',
          style: loginSignupStyle.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignupUseridScreen(
                          widget.emailController, passwordController)),
                );
              },
              child: Container(
                height: 50,
                color: logButtonReady,
                child: Center(
                  child: Text(
                    'Confirm',
                    style: loginSignupStyle.loginSignupButton,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
