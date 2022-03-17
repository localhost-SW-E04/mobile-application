import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehyog/pages/widgets/drawer_tile.dart';

import '../pages/widgets/header_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      drawer: Drawer(
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
      ),
      body: Stack(
        children: [
          Container(
            height: 140,
            child: HeaderWidget(
              140,
              true,
              'assets/images/sehyog_short.png',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Dr. Samaresh Samantha',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Former President',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 4.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "User Information",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 4,
                              ),
                              child: Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      ListTile(
                                        // contentPadding:
                                        //     EdgeInsets.symmetric(
                                        //         horizontal: 12,
                                        //         vertical: 4),
                                        leading: Icon(Icons.credit_card),
                                        title: Text("Aadhar Card"),
                                        subtitle: Text("315486045626"),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.email),
                                        title: Text("Email"),
                                        subtitle: Text("dr.samaresh@gmail.com"),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.phone),
                                        title: Text("Phone"),
                                        subtitle: Text("+91 977246 32283"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
