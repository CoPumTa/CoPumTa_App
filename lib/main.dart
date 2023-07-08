import 'package:client/pages/login/login_page.dart';
import 'package:flutter/material.dart';

import 'components/bottom_navigation_bar.dart';
import './style.dart';
import './pages/timer.dart';
import './pages/tab2.dart';
import './pages/tab3.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
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
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        home: Scaffold(
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                Timer(),
                LoginPage(),
                Tab3(),
              ]),
          bottomNavigationBar: NavBar(_tabController),
        ));
  }
}
