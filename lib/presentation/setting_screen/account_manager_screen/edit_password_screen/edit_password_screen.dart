import 'package:demo_toctoc/data/service/user_service.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:demo_toctoc/resources/utils.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class EditPasswordScreen extends StatefulWidget {
  EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  var loginSignupStyle = LoginSignupStyle();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

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
          'Edit Password',
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
              controller: currentPasswordController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'Current Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: newPasswordController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'New Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmNewPasswordController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: 'Confirm New Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (newPasswordController.text ==
                    confirmNewPasswordController.text) {
                  await UserService.updatePassword(
                    context: context,
                    currentPassword: currentPasswordController.text,
                    newPassword: newPasswordController.text,
                  );
                  await UserService.editUserProperty(
                    context: context,
                    userProperty: 'password',
                    newUpdate: newPasswordController.text,
                  );
                } else {
                  Utils.showSnackBar('Wrong confirm password!!', 2);
                }
              },
              child: Container(
                height: 50,
                color: logButtonReady,
                child: Center(
                  child: Text(
                    'Edit Password',
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
