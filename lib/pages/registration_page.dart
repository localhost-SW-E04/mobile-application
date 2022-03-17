import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../common/theme_helper.dart';
import '../pages/widgets/header_widget.dart';
import 'profile_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  bool aadharValid = false;
  RoundedLoadingButtonController _controller = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    _controller.reset();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: HeaderWidget(250, true, 'assets/images/sehyog_short.png'),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if ((val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Stack(
                          children: [
                            Container(
                              child: TextFormField(
                                onTap: () {
                                  _controller.reset();
                                  _controller.start();
                                },
                                onChanged: (value) async {
                                  if (value.length == 12) {
                                    var response = await http.post(
                                      Uri.parse(
                                          "https://kyc-api.aadhaarkyc.io/api/v1/aadhaar-validation/aadhaar-validation"),
                                      headers: {
                                        "Content-Type": "text/plain",
                                        "Accept": "application/json",
                                        "Authorization":
                                            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoiYWNjZXNzIiwiaWRlbnRpdHkiOiJkZXYua2FydHBheUBhYWRoYWFyYXBpLmlvIiwibmJmIjoxNTkyOTAxMjQxLCJpYXQiOjE1OTI5MDEyNDEsImp0aSI6ImZhZmU2ZjkxLWM0ZWQtNDk3My1hZDg1LTcwOGZjOTI1MzhhMSIsImZyZXNoIjpmYWxzZSwidXNlcl9jbGFpbXMiOnsic2NvcGVzIjpbInJlYWQiXX0sImV4cCI6MTkwODI2MTI0MX0.JGy3fqwKfd5oHJwEa5RDTGcyz0JDJtBhYri6Z8WcBdE"
                                      },
                                      body: jsonEncode({"id_number": value}),
                                    );
                                    Map decodedData = jsonDecode(response.body);
                                    print(decodedData);
                                    if (decodedData.isNotEmpty) {
                                      final bool successValue =
                                          decodedData["success"];
                                      print(successValue);
                                      print(successValue.runtimeType);
                                      aadharValid = successValue;
                                      if (successValue) {
                                        _controller.success();
                                      } else {
                                        _controller.error();
                                      }
                                    }
                                  }
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(12),
                                ],
                                decoration: ThemeHelper().textInputDecoration(
                                    "Aadhar Number",
                                    "Enter your aadhar number"),
                                keyboardType: TextInputType.phone,
                                validator: (val) {
                                  print(val);
                                  if (val!.isEmpty || val.length != 12) {
                                    return "Enter a valid aadhar number";
                                  }
                                  return null;
                                },
                              ),
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: window.physicalSize.width / 4.5),
                              child: RoundedLoadingButton(
                                valueColor: Colors.black,
                                animateOnTap: false,
                                disabledColor: Colors.white,
                                width: 50,
                                controller: _controller,
                                successColor: Colors.green,
                                onPressed: null,
                                child: Text(""),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty && val.length < 6) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Confirm Password*",
                                "Enter your password "
                                    "once again"),
                            validator: (val) {
                              if (val!.isEmpty && val.length < 6) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()),
                                    (Route<dynamic> route) => false);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
