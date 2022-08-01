import 'package:flutter/material.dart';

import '../home_user_button.dart';
import '../home_user_caption.dart';

class DemoPage3 extends StatelessWidget {
  const DemoPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Image.network(
              'https://images.unsplash.com/photo-1621369116334-7913d4cff562?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmF0dXJlJTIwcG9ydHJhaXR8ZW58MHx8MHx8&w=1000&q=80',
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
