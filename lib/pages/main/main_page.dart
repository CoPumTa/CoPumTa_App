import 'package:client/pages/challenge/challenge_page.dart';
import 'package:client/pages/home/home_page.dart';
import 'package:client/pages/setting/setting_page.dart';
import 'package:client/style.dart';
import 'package:flutter/material.dart';
import 'package:client/pages/main/bottom_navigation_bar.dart';

/* 로그인 성공시 출력되는 main page로, 세개의 탭을 조정하기 위함 */
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = const [
    Tab(icon: Icon(Icons.phone)),
    Tab(icon: Icon(Icons.perm_media)),
    Tab(icon: Icon(Icons.contact_page)),
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: subColor,
      // appBar:
      // AppBar(
      //   toolbarHeight: 36.0,
      //   backgroundColor: mainColor,
      //   elevation: 0,
      //   title: Text(getToday()),
      //   titleTextStyle: TextStyle(
      //       color: lightColor, fontWeight: FontWeight.w500, fontSize: 16),
      //   centerTitle: true,
      // ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [HomePage(), ChallengePage(), SettingPage()]),
      bottomNavigationBar: NavBar(_tabController),
    );
  }
}
