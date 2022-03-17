import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sehyog/pages/widgets/medical_history_card.dart';

import '../common/constants.dart';

class UserDetailsDashboard extends StatelessWidget {
  const UserDetailsDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/card.png'),
              width: window.physicalSize.width - 700,
            ),
            Column(
              children: [
                Text(
                  "Tanishq Kashyap",
                  style: kAadharCardStyle,
                ),
                Text(
                  "25-05-2002",
                  style: kAadharCardStyle,
                ),
                Text(
                  "Male",
                  style: kAadharCardStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3154 8604 5626",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
            width: MediaQuery.of(context).size.width - 45,
            height: 400,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade200,
                  offset: Offset(2.0, 2.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF7AD7F8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Medical History",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 65,
                  height: 320,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    color: Color(0xFF57C7EE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: Colors.black,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return MedicalHistoryCard();
                      },
                      itemCount: 6,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
