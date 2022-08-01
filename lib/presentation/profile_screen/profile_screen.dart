import 'package:demo_toctoc/data/model/profile_model.dart';
import 'package:demo_toctoc/presentation/setting_screen/setting_screen.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'profile_user_favorite_video.dart';
import 'profile_user_information.dart';
import 'profile_user_liked_video.dart';
import 'profile_user_private_video.dart';
import 'profile_user_video.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  var profileStyle = ProfileStyle();
  var demoUser = DemoUser();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          iconTheme: const IconThemeData(
            color: black,
          ),
          centerTitle: true,
          title: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  demoUser.userName,
                  style: profileStyle.usernameSwitch,
                ),
                const Icon(
                  Icons.expand_more,
                  size: 28,
                ),
              ],
            ),
          ),
          leading: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Chức năng này hiện đang trong giai đoạn phát triển!!',
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.person_add_alt_rounded),
          ),
          actions: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Chức năng này hiện đang trong giai đoạn phát triển!!',
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.remove_red_eye_outlined),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: UserInformation(),
              ),
            ];
          },
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.grid_3x3,
                      color: black,
                      size: 24,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.lock_outline_rounded,
                      color: black,
                      size: 24,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.bookmark_outline,
                      color: black,
                      size: 24,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.favorite_border,
                      color: black,
                      size: 24,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    UserVideo(),
                    UserPrivateVideo(),
                    UserFavoriteVideo(),
                    UserLikedVideo(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
