import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehyog/pages/hospital_dashboard.dart';
import 'package:sehyog/pages/user_details_dashboard.dart';
import 'package:sehyog/pages/widgets/common_app_bar.dart';
import 'package:sehyog/pages/widgets/header_widget.dart';
import 'package:sehyog/pages/widgets/navigation_drawer.dart';

class MainDashboard extends StatefulWidget {
  MainDashboard({Key? key}) : super(key: key);

  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _activeIndex = 0;
  List<StatelessWidget> pages = [
    UserDetailsDashboard(),
    HospitalDashboard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            ),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.diagnoses,
              color: Colors.white.withAlpha(230),
            ),
          ),
        ),
        onPressed: () {
          print("FAB Pressed");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        notchSmoothness: NotchSmoothness.smoothEdge,
        activeColor: Theme.of(context).primaryColor,
        gapLocation: GapLocation.center,
        icons: [
          Icons.home,
          Icons.local_hospital_rounded,
        ],
        activeIndex: _activeIndex,
        onTap: (int) {
          setState(() {
            _activeIndex = int;
          });
        },
      ),
      appBar: commonAppBar(context, "Dashboard"),
      drawer: NavigationDrawer(
        drawerIconSize: 17,
      ),
      body: Stack(
        children: [
          Container(
            height: 150,
            child: HeaderWidget(
              150,
              false,
              'assets/images/sehyog.png',
            ),
          ),
          SafeArea(
            child: Container(
              width: window.physicalSize.width,
              child: SingleChildScrollView(
                child: pages[_activeIndex],
              ),
            ),
          )
        ],
      ),
    );
  }
}
