import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson5/pages/main_page.dart';
import 'package:lesson5/pages/profile_page.dart';
import 'package:lesson5/pages/reels_page.dart';
import 'package:lesson5/pages/search_page.dart';

import 'add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchState = true;
  int currentIndex = 0;

  var pageList = [
    const MainPage(),
    const SearchPage(),
    const AddPage(),
    const ReelsPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pageList[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        onTap: (position) {
          setState(() {
            currentIndex = position;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home_icon.svg"),
            label: "Bosh sahifa",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Qidirish",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "Qo'shish",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/reels.svg"),
            label: "Reels",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
