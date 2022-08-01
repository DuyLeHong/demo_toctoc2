import 'package:demo_toctoc/presentation/other_profile_screen/other_profile_screen.dart';
import 'package:demo_toctoc/resources/colors.dart';
import 'package:flutter/material.dart';

import '../../resources/styles.dart';

class UserButton extends StatefulWidget {
  const UserButton({Key? key}) : super(key: key);

  @override
  State<UserButton> createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  var homeStyle = HomeStyle();

  bool related = true;
  bool following = false;
  bool isLiked = false;
  bool isFavorited = false;

  int numLiked = 2526353;
  int numComment = 23295;
  int numFavorited = 12;
  int numShared = 2301;

  String numberRender(int a) {
    if (a > 1000000) {
      return '${(a / 100000).round() / 10}M';
    } else if (a > 10000) {
      return '${(a / 100).round() / 10}K';
    } else {
      return '$a';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: white,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OtherProfileScreen()),
                                );
                              },
                              child: Image.network(
                                'https://byuc.files.wordpress.com/2012/07/avat-2.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -8,
                          left: 14,
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Followed!',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: followButton,
                              ),
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: (isLiked)
                        ? const Icon(
                            Icons.favorite,
                            color: favorite,
                            size: 40,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: white,
                            size: 40,
                          ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      numberRender(numLiked),
                      textAlign: TextAlign.center,
                      style: homeStyle.reactionNumber,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chat_bubble,
                      color: white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      numberRender(numComment),
                      textAlign: TextAlign.center,
                      style: homeStyle.reactionNumber,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                    icon: (isFavorited)
                        ? const Icon(
                            Icons.bookmark,
                            color: bookmark,
                            size: 40,
                          )
                        : const Icon(
                            Icons.bookmark,
                            color: white,
                            size: 40,
                          ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      numberRender(numFavorited),
                      textAlign: TextAlign.center,
                      style: homeStyle.reactionNumber,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      numberRender(numShared),
                      textAlign: TextAlign.center,
                      style: homeStyle.reactionNumber,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.disc_full,
                      color: white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
