import 'package:demo_toctoc/presentation/home_screen/home_user_button.dart';
import 'package:flutter/material.dart';

import '../home_user_caption.dart';

class DemoPage2 extends StatelessWidget {
  const DemoPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/anh_thien_nhien_2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          UserButton(),
          UserCaption(),
        ],
      ),
    );
  }
}
