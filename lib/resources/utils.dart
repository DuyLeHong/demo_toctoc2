import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(
    String text,
    int second,
  ) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: second),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
