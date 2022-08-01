import 'package:demo_toctoc/data/model/target_profile_model.dart';
import 'package:demo_toctoc/resources/colors.dart';
import 'package:demo_toctoc/resources/styles.dart';
import 'package:flutter/material.dart';

class OtherUserInformation extends StatefulWidget {
  OtherUserInformation({Key? key}) : super(key: key);

  @override
  State<OtherUserInformation> createState() => _OtherUserInformationState();
}

class _OtherUserInformationState extends State<OtherUserInformation> {
  var profileStyle = ProfileStyle();
  var demoTargetUser = DemoTargetUser();

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
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Container(
            clipBehavior: Clip.antiAlias,
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Image.network(
              'https://i.pinimg.com/736x/56/49/70/564970f574b3cbd9f11a08833634fd13.jpg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: InkWell(
            onTap: () {},
            child: Text(
              '@${demoTargetUser.userName}',
              style: profileStyle.username,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 96,
              child: Column(
                children: [
                  Text(
                    numberRender(demoTargetUser.numFollowing),
                    style: profileStyle.reactionNumber,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Following',
                    style: profileStyle.reactionLabel,
                  ),
                ],
              ),
            ),
            Container(
              color: profileInteractLabel,
              width: 1,
              height: 18,
            ),
            SizedBox(
              width: 96,
              child: Column(
                children: [
                  Text(
                    numberRender(demoTargetUser.numFollower),
                    style: profileStyle.reactionNumber,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Followers',
                    style: profileStyle.reactionLabel,
                  ),
                ],
              ),
            ),
            Container(
              color: profileInteractLabel,
              width: 1,
              height: 18,
            ),
            SizedBox(
              width: 96,
              child: Column(
                children: [
                  Text(
                    numberRender(demoTargetUser.numLiked),
                    style: profileStyle.reactionNumber,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Liked',
                    style: profileStyle.reactionLabel,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        (demoTargetUser.isInFollowList)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: buttonBorder,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Send message',
                        style: profileStyle.buttonText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        demoTargetUser.isInFollowList = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: buttonBorder,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.check_circle_outline,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: buttonBorder,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        demoTargetUser.isInFollowList = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 60),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: buttonBorder,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Follow',
                        style: profileStyle.buttonTextWhite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: buttonBorder,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            demoTargetUser.userDescription,
            textAlign: TextAlign.center,
            style: profileStyle.userDescription,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
