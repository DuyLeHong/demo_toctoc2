import 'package:demo_toctoc/data/service/user_service.dart';
import 'package:demo_toctoc/presentation/setting_screen/account_manager_screen/account_manager_screen.dart';
import 'package:demo_toctoc/resources/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AuthService {
  static signupWithEmail({
    required BuildContext context,
    required email,
    required password,
    required userId,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await UserService.createUserWithEmail(
        email: email,
        password: password,
        userId: userId,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  static loginWithEmail({
    required BuildContext context,
    required email,
    required password,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  static editEmail({
    required BuildContext context,
    required newEmail,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await UserService.updateEmail(
        context: context,
        newEmail: newEmail,
      );
      await UserService.editUserProperty(
        context: context,
        userProperty: 'email',
        newUpdate: newEmail,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountManagerScreen()),
      );
    } catch (e) {
      Utils.showSnackBar(e.toString(), 2);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  static editPassword({
    required BuildContext context,
    required String currentPassword,
    required String newPassword,
  }) async {
    await UserService.updatePassword(
      context: context,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  static signOut({
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
