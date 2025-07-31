import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch/screens/feed_screen.dart';
import 'package:twitch/screens/go_live_screen.dart';
import 'package:twitch/utils/colors.dart';

import '../providers/userprovider.dart';

class homeScreen extends StatefulWidget {
  static const routeName = '/home';

  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _page = 0;
  List<Widget> pages = [
    const feedScreen(),
    const goLiveScreen(),
    const Center(child: Text("Browse")),
  ];

  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: buttonColor,
        unselectedItemColor: primaryColor,
        backgroundColor: backgroundColor,
        onTap: onPageChange,
        currentIndex: _page,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "follwing",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: "Go Live",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.copy), label: "Browse"),
        ],
      ),
      body: pages[_page],
    );
  }
}
