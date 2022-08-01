import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_toctoc/data/service/auth_service.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../resources/colors.dart';

class SignupUseridScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  SignupUseridScreen(this.emailController, this.passwordController, {Key? key})
      : super(key: key);

  @override
  State<SignupUseridScreen> createState() => _SignupUseridScreenState();
}

class _SignupUseridScreenState extends State<SignupUseridScreen> {
  var loginSignupStyle = LoginSignupStyle();
  TextEditingController useridController = TextEditingController();

  void signUpAndCreateAccount() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: widget.emailController.text.trim(),
      password: widget.passwordController.text.trim(),
    );
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    int randomUserNumber = Random().nextInt(9000000) + 1000000;
    users
        .doc(auth.currentUser!.uid)
        .set({
          'email': widget.emailController.text,
          'password': widget.passwordController.text,
          'userID': useridController.text,
          'userName': 'user${randomUserNumber.toString()}',
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

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
          'Enter your User ID',
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
              controller: useridController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: 'Enter your User ID',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                AuthService.signupWithEmail(
                    context: context,
                    email: widget.emailController.text,
                    password: widget.passwordController.text,
                    userId: useridController.text,
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
