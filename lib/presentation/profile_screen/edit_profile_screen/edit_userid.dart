import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../../data/service/user_service.dart';
import '../../../resources/colors.dart';

class EditUseridScreen extends StatelessWidget {
  EditUseridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingStyle = SettingStyle();
    TextEditingController useridController =
        TextEditingController(text: 'old userID');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black,
        ),
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'User ID',
          style: settingStyle.settingTitle,
        ),
        actions: [
          TextButton(
            onPressed: () {
              UserService.editUserProperty(
                context: context,
                userProperty: 'userID',
                newUpdate: useridController.text,
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
              'User ID',
              style: settingStyle.settingResult,
            ),
            TextFormField(
              controller: useridController,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
