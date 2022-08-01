import 'package:demo_toctoc/data/model/profile_model.dart';
import 'package:demo_toctoc/presentation/profile_screen/edit_profile_screen/edit_user_description.dart';
import 'package:demo_toctoc/presentation/profile_screen/edit_profile_screen/edit_userid.dart';
import 'package:demo_toctoc/presentation/profile_screen/edit_profile_screen/edit_username.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  var settingStyle = SettingStyle();
  var demoUser = DemoUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        iconTheme: const IconThemeData(
          color: black,
        ),
        centerTitle: true,
        title: Text(
          'Edit profile',
          style: settingStyle.settingTitle,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.network(
                    'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000',
                    fit: BoxFit.contain,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: white,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Edit avatar',
            textAlign: TextAlign.center,
            style: settingStyle.settingOption,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Public Information',
                  style: settingStyle.settingResult,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditUsernameScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User Name',
                        style: settingStyle.settingOption,
                      ),
                      Text(
                        'abcd',
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
                    MaterialPageRoute(builder: (context) => EditUseridScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User ID',
                        style: settingStyle.settingOption,
                      ),
                      Text(
                        'abcd.1234',
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
                    MaterialPageRoute(
                        builder: (context) => EditUserDescriptionScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User Description',
                        style: settingStyle.settingOption,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          'This is a long story',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: settingStyle.settingResult,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
