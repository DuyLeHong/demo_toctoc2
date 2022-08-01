import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_toctoc/presentation/profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserService {
  static createUserWithEmail({
    required email,
    required password,
    required userId,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    int randomUserNumber = Random().nextInt(9000000) + 1000000;
    await users
        .doc(auth.currentUser!.uid)
        .set({
          'avatarURL':
              'https://www.caribbeangamezone.com/wp-content/uploads/2018/03/avatar-placeholder.png',
          'email': email,
          'password': password,
          'userID': userId,
          'userName': 'user${randomUserNumber.toString()}',
          'userDesc': '',
          'followingList': <dynamic>[],
          'followerList': <dynamic>[],
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static updateEmail({
    required BuildContext context,
    required newEmail,
  }) async {
    try {
      FirebaseAuth.instance.currentUser?.updateEmail(newEmail);
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  static updatePassword({
    required BuildContext context,
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = FirebaseAuth.instance.currentUser!;
    final cred = EmailAuthProvider.credential(
        email: user.email!, password: currentPassword);

    await user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        //Success, do something
      }).catchError((error) {
        //Error, show something
      });
    }).catchError((err) {});
    Navigator.of(context).pop();
  }

  static editUserProperty({
    required BuildContext context,
    required userProperty,
    required newUpdate,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final FirebaseAuth auth = FirebaseAuth.instance;
      await users
          .doc(auth.currentUser!.uid)
          .update({
            userProperty: newUpdate,
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditProfileScreen()),
      );
    } catch (e) {
      print(e);
    }
  }
}
