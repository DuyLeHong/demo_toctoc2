import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../other_profile_screen/other_profile_screen.dart';

class UserCaption extends StatelessWidget {
  UserCaption({Key? key}) : super(key: key);
  var homeStyle = HomeStyle();

  String username = '@username';
  String caption = 'This is a  sdjhfgasjhdgsjdsakjdhsakd caption.';
  List hashtag = <String>[
    '#flutter',
    '#tiktok',
    '#clone',
    '#fyp',
    '#savetheworld',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              // color: Colors.orange,
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtherProfileScreen()),
                      );
                    },
                    child: Text(
                      username,
                      style: homeStyle.username,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: caption,
                          style: homeStyle.caption,
                        ),
                        TextSpan(
                          text: ' ${hashtag.join(' ')}',
                          style: homeStyle.hashtag,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Chức năng này hiện đang trong giai đoạn phát triển!!',
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.my_library_music,
                      color: white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Sound - This is the sound from ABCD.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: homeStyle.sound,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
