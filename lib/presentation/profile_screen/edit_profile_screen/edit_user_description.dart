import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../../data/service/user_service.dart';
import '../../../resources/colors.dart';

class EditUserDescriptionScreen extends StatelessWidget {
  EditUserDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingStyle = SettingStyle();
    TextEditingController userDescController =
        TextEditingController(text: 'old user desc');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black,
        ),
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'User Description',
          style: settingStyle.settingTitle,
        ),
        actions: [
          TextButton(
            onPressed: () {
              UserService.editUserProperty(
                context: context,
                userProperty: 'userDesc',
                newUpdate: userDescController.text,
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
              'User Description',
              style: settingStyle.settingResult,
            ),
            TextFormField(
              controller: userDescController,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
