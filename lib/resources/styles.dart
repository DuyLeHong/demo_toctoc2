import 'package:demo_toctoc/resources/colors.dart';
import 'package:flutter/material.dart';

class HomeStyle {
  TextStyle tabBar = const TextStyle(
    fontSize: 18,
  );

  TextStyle reactionNumber = const TextStyle(
    fontSize: 14,
    color: white,
  );

  TextStyle username = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: white,
  );

  TextStyle caption = const TextStyle(
    fontSize: 14,
    color: lightWhite,
  );

  TextStyle hashtag = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: white,
  );

  TextStyle sound = const TextStyle(
    fontSize: 14,
    color: white,
  );
}

class ProfileStyle {
  TextStyle usernameSwitch = const TextStyle(
    color: black,
  );

  TextStyle username = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  TextStyle reactionNumber = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  TextStyle reactionLabel = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: profileInteractLabel,
  );

  TextStyle buttonText = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  TextStyle buttonTextWhite = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: white,
  );

  TextStyle userDescription = const TextStyle(
    fontSize: 14,
  );
}

class LoginSignupStyle {
  TextStyle bigTitle = const TextStyle(
    fontSize: 40,
    color: black,
  );

  TextStyle title = const TextStyle(
    color: black,
  );

  TextStyle buttonText = const TextStyle(
    color: black,
  );

  TextStyle loginSignupButton = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: white,
  );

  TextStyle bottomText = const TextStyle(
    color: black,
  );

  TextStyle bottomTextClick = const TextStyle(
    color: logButtonReady,
  );

  TextStyle forgotPassword = const TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.italic,
    color: logButtonReady,
  );
}

class SettingStyle {
  TextStyle settingTitle = const TextStyle(
    color: black,
  );

  TextStyle title = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  TextStyle settingOption = const TextStyle(
    fontSize: 16,
  );

  TextStyle settingResult = const TextStyle(
    fontSize: 16,
    color: grey,
  );
}
