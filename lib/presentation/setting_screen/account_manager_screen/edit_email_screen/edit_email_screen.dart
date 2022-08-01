import 'package:demo_toctoc/data/service/user_service.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:demo_toctoc/resources/utils.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class EditEmailScreen extends StatefulWidget {
  EditEmailScreen({Key? key}) : super(key: key);

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  var loginSignupStyle = LoginSignupStyle();

  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();

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
          'Edit Email',
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
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'New Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmEmailController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: 'Confirm New Email',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                if (emailController == confirmEmailController) {
                  // AuthService.editEmail(
                  //   context: context,
                  //   newEmail: emailController.text,
                  // );
                  UserService.updateEmail(
                    context: context,
                    newEmail: emailController.text,
                  );
                } else {

                }
              },
              child: Container(
                height: 50,
                color: logButtonReady,
                child: Center(
                  child: Text(
                    'Edit Email',
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
