import 'package:demo_toctoc/data/model/target_profile_model.dart';
import 'package:demo_toctoc/presentation/other_profile_screen/other_profile_favorite_video.dart';
import 'package:demo_toctoc/presentation/other_profile_screen/other_profile_user_information.dart';
import 'package:demo_toctoc/presentation/other_profile_screen/other_profile_user_video.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class OtherProfileScreen extends StatefulWidget {
  OtherProfileScreen({Key? key}) : super(key: key);

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {
  var profileStyle = ProfileStyle();
  var demoTargetUser = DemoTargetUser();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          iconTheme: const IconThemeData(
            color: black,
          ),
          centerTitle: true,
          title: Text(
            demoTargetUser.userName,
            style: profileStyle.usernameSwitch,
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
              icon: const Icon(Icons.notifications_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: OtherUserInformation(),
              ),
            ];
          },
          body: Column(
            children: const [
              TabBar(
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
                    OtherUserVideo(),
                    OtherUserFavoriteVideo(),
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
