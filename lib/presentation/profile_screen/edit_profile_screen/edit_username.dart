import 'package:demo_toctoc/data/service/user_service.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class EditUsernameScreen extends StatelessWidget {
  EditUsernameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingStyle = SettingStyle();
    TextEditingController usernameController =
        TextEditingController(text: 'old username');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black,
        ),
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'User Name',
          style: settingStyle.settingTitle,
        ),
        actions: [
          TextButton(
            onPressed: () {
              UserService.editUserProperty(
                context: context,
                userProperty: 'userName',
                newUpdate: usernameController.text,
              );
            },
            child: Text(
              'Save',
              style: settingStyle.settingOption,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'User Name',
              style: settingStyle.settingResult,
            ),
            TextFormField(
              controller: usernameController,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
