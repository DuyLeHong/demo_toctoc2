import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Data Access Layer: Tầng truy cập và lưu trữ dữ liệu.

class DemoUser {
  var user = FirebaseAuth.instance.currentUser!;
  String userName = 'my_username';
  String userDescription = 'This is a description.\nDescription.';
  int numFollowing = 1326;
  int numFollower = 57444;
  int numLiked = 3425976;
  String email = FirebaseAuth.instance.currentUser!.email!;
}

class FirebaseUser {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String? userName;

  // FirebaseUser(this.userName) {
  //   userName = users['userName'];
  // }
}
