import 'package:demo_toctoc/presentation/friends_screen/friends_screen.dart';
import 'package:demo_toctoc/presentation/home_screen/home_screen.dart';
import 'package:demo_toctoc/presentation/inbox_screen/inbox_screen.dart';
import 'package:demo_toctoc/presentation/profile_screen/profile_screen.dart';
import 'package:demo_toctoc/presentation/upload_screen/upload_screen.dart';
import 'package:demo_toctoc/resources/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final user = FirebaseAuth.instance.currentUser!;
  int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FriendsScreen(),
    Scaffold(),
    InboxScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UploadScreen()),
      );
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: navBarBorder,
              width: 0.8,
            ),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: _bottomNavBarBackgroundPicker(),
          currentIndex: selectedIndex,
          selectedItemColor: _bottomNavBarSelectedPicker(),
          unselectedItemColor: _bottomNavBarUnselectedPicker(),
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                  Icon((selectedIndex == 0) ? Icons.home : Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  (selectedIndex == 1) ? Icons.people : Icons.people_outlined),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: _bottomNavBarSelectedPicker(),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  (selectedIndex == 3) ? Icons.inbox : Icons.inbox_outlined),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  (selectedIndex == 4) ? Icons.person : Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Color _bottomNavBarBackgroundPicker() {
    if (selectedIndex < 1) {
      return transparent;
    } else {
      return white;
    }
  }

  Color _bottomNavBarSelectedPicker() {
    if (selectedIndex < 1) {
      return white;
    } else {
      return black;
    }
  }

  Color _bottomNavBarUnselectedPicker() {
    if (selectedIndex < 1) {
      return white;
    } else {
      return bottomNavBarUnselected;
    }
  }
}
