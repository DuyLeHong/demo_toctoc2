import 'package:demo_toctoc/presentation/setting_screen/account_manager_screen/delete_account_screen/delete_account_screen.dart';
import 'package:demo_toctoc/presentation/setting_screen/account_manager_screen/edit_email_screen/edit_email_screen.dart';
import 'package:demo_toctoc/presentation/setting_screen/account_manager_screen/edit_password_screen/edit_password_screen.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class AccountManagerScreen extends StatelessWidget {
  AccountManagerScreen({Key? key}) : super(key: key);
  var settingStyle = SettingStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: black,
        ),
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'Account manager',
          style: settingStyle.settingTitle,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            child: Text(
              'ACCOUNT INFORMATION',
              style: settingStyle.title,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditEmailScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email',
                    style: settingStyle.settingOption,
                  ),
                  Text(
                    '******@gmail.com',
                    style: settingStyle.settingResult,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditPasswordScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Password',
                    style: settingStyle.settingOption,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeleteAccountScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Delete Account',
                    style: settingStyle.settingOption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
