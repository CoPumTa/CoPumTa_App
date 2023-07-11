import 'package:client/pages/home/home_page.dart';
import 'package:client/style.dart';
import 'package:client/utils.dart';
import 'package:flutter/material.dart';
import 'package:client/components/bottom_navigation_bar.dart';
import 'package:client/pages/tab2.dart';
import 'package:client/pages/tab3.dart';
import 'package:client/pages/timer/timer.dart';

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
      backgroundColor: lightColor,
      appBar: AppBar(
        toolbarHeight: 36.0,
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(getToday()),
        titleTextStyle: TextStyle(
            color: lightColor, fontWeight: FontWeight.w500, fontSize: 16),
        centerTitle: true,
      ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [HomePage(), Tab2(), Tab3()]),
      bottomNavigationBar: NavBar(_tabController),
    );
  }
}
