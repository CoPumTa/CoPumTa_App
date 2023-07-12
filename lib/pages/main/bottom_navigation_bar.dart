import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:client/style.dart';

class NavBar extends StatelessWidget {
  final TabController tabController;

  const NavBar(this.tabController, {super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
        onTabChange: (index) => tabController.animateTo(index),
        tabMargin: const EdgeInsets.all(10),
        backgroundColor: subColor,
        rippleColor: lightColor, // tab button ripple color when pressed
        // hoverColor: lightColor, // tab button hover color
        haptic: true, // haptic feedback
        tabBorderRadius: 15,
        tabActiveBorder:
            Border.all(color: lightColor, width: 1), // tab button border
        // tabBorder: Border.all(color: Colors.black, width: 1), // tab button border
        // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
        curve: Curves.easeOutExpo, // tab animation curves
        duration: const Duration(milliseconds: 300), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: mainColor, // unselected icon color
        activeColor: lightColor, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: subColor, // selected tab background color
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // navigation bar padding
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        tabs: const [
          GButton(
            icon: Icons.timer,
            text: 'timer',
          ),
          GButton(
            icon: Icons.trending_up,
            text: 'challenge',
          ),
          GButton(
            icon: Icons.store,
            text: 'store',
          ),
        ]);
  }
}
