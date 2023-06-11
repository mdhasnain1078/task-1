import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/constant/appColors.dart';
import 'package:task1/constant/utils.dart';

import 'homeScreen.dart';


class homeWrapper extends StatefulWidget {
  homeWrapper({super.key});

  @override
  State<homeWrapper> createState() => _homeWrapperState();
}

class _homeWrapperState extends State<homeWrapper> {

  List<Widget> screens = [
    const HomeScreen(),
    const Center(child: Text("Learn")),
    const Center(child: Text("Hub")),
    const Center(child: Text("Chat")),
    const Center(child: Text("Profile"))
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColor.color.appDarkGrey,
        selectedItemColor: AppColor.color.appBlue,
        currentIndex: _currentIndex,
        onTap: (value){
          setState(() {
            _currentIndex = value;
            print(_currentIndex);
          });
        },
        items: [
        BottomNavigationBarItem(icon: reuseIcon("assets/svg/home.svg", AppColor.color.appDarkGrey,),
        activeIcon: reuseIcon("assets/svg/home.svg", AppColor.color.appBlue,),
        label: "Home"
        ),
        BottomNavigationBarItem(icon: reuseIcon("assets/svg/learn.svg", AppColor.color.appDarkGrey,),
        activeIcon: reuseIcon("assets/svg/learn.svg", AppColor.color.appBlue,),
        label: "Learn"
        ),
        BottomNavigationBarItem(icon: reuseIcon("assets/svg/hub.svg", AppColor.color.appDarkGrey,),
        activeIcon: reuseIcon("assets/svg/hub.svg", AppColor.color.appBlue,),
        label: "Hub"
        ),
        BottomNavigationBarItem(icon: reuseIcon("assets/svg/chat.svg", AppColor.color.appDarkGrey,),
        activeIcon: reuseIcon("assets/svg/chat.svg", AppColor.color.appBlue,),
        label: "Chat"
        ),
         BottomNavigationBarItem(icon: CircleAvatar(
          radius: 10, backgroundColor: AppColor.color.appDarkGrey,
          child: CircleAvatar(
            radius: 9,
            backgroundColor: Colors.white,
            child: Image.asset("assets/image/profileImage.png", fit: BoxFit.cover,),),),
        activeIcon: CircleAvatar(radius: 10,child: CircleAvatar(
          radius: 9,
            backgroundColor: Colors.white,
          child: Image.asset("assets/image/profileImage.png", fit: BoxFit.cover,),
            ),
            ),
        label: "Profile"
        ),
      ]),
    );
  
  }
}