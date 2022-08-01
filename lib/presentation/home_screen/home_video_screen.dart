import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Paused!',
            ),
            duration: Duration(seconds: 2),
          ),
        );
      },
      onDoubleTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Liked!',
            ),
            duration: Duration(seconds: 2),
          ),
        );
      },
      splashColor: Colors.transparent,
      child: Center(
        child: Image.asset(
          // child ở phía trong Center sẽ là video, bất kể độ phân giải.
          'assets/images/anh_thien_nhien.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
