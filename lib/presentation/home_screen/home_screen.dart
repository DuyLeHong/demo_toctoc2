import 'package:demo_toctoc/presentation/home_screen/home_screen_following.dart';
import 'package:demo_toctoc/presentation/home_screen/home_screen_related.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var homeStyle = HomeStyle();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
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
            icon: const Icon(
              Icons.connected_tv,
              size: 30,
              color: white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: white,
              ),
            ),
          ],
          title: TabBar(
            labelColor: white,
            unselectedLabelColor: lightWhite,
            indicatorColor: white,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Following',
                  style: homeStyle.tabBar,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Related',
                  style: homeStyle.tabBar,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreenFollowing(),
            HomeScreenRelated(),
          ],
        ),
      ),
    );
  }
}
