import 'package:demo_toctoc/presentation/auth_screen/signup_screen/signup_password_screen.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class SignupEmailScreen extends StatefulWidget {
  SignupEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignupEmailScreen> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  var loginSignupStyle = LoginSignupStyle();
  TextEditingController emailController = TextEditingController();

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
          'Enter your email',
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
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) {},
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SignupPasswordScreen(emailController)),
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
