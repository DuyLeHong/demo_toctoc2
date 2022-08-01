import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Message',
          style: TextStyle(
            color: Colors.black,
          ),
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
            icon: Icon(
              Icons.add,
              size: 24,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('Message screen!'),
      ),
    );
  }
}
