import 'package:flutter/material.dart';

import '../login_page.dart';

AppBar commonAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
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
      InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(
            Icons.logout_rounded,
          ),
        ),
      ),
    ],
  );
}
