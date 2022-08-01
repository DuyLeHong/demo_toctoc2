import 'package:demo_toctoc/presentation/setting_screen/account_manager_screen/account_manager_screen.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../data/service/auth_service.dart';
import '../../resources/colors.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
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
          'Setting',
          style: settingStyle.settingTitle,
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountManagerScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.person_outline,
                    size: 24,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Account manager',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AuthService.signOut(context: context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 24,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Sign out',
                    style: TextStyle(
                      fontSize: 16,
                    ),
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
