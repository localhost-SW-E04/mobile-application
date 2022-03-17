import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
    required double drawerIconSize,
  })  : _drawerIconSize = drawerIconSize,
        super(key: key);

  final double _drawerIconSize;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Center(
                      child: Image(
                        image: AssetImage(
                          "assets/images/sehyog.png",
                        ),
                        width: 250,
                      ),
                    ),
                  ),
                ),
                DrawerTile(
                  icon: Icons.dashboard_rounded,
                  text: "Dashboard",
                  drawerIconSize: _drawerIconSize,
                ),
                DrawerTile(
                  icon: Icons.local_pharmacy_rounded,
                  text: "Pharmacy",
                  drawerIconSize: _drawerIconSize,
                ),
                DrawerTile(
                  icon: Icons.history_rounded,
                  text: "Medical History",
                  drawerIconSize: _drawerIconSize,
                ),
                DrawerTile(
                  icon: Icons.contact_phone_rounded,
                  text: "Contact Us",
                  drawerIconSize: _drawerIconSize,
                ),
                DrawerTile(
                  icon: Icons.logout_rounded,
                  text: "Logout",
                  drawerIconSize: _drawerIconSize,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Terms and Conditions",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "  |  ",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "About Us",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
