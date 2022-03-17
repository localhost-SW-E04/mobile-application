import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sehyog/pages/widgets/medical_history_card.dart';

import '../common/theme_helper.dart';

class HospitalDashboard extends StatelessWidget {
  const HospitalDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 16,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey.shade100.withOpacity(0.25),
              ),
              width: MediaQuery.of(context).size.width - 45,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text(
                        "Hospitals",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: TextField(
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                              'Hospital Name', 'Enter hospital name'),
                        ),
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24,
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
                  "Available Hospitals",
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
