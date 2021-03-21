import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pmas/screens/AnimationLogin.dart';
import 'installerdashboard.dart';
import 'supervisorsdashbord.dart';

class MyLoginScreen extends StatefulWidget {
  @override
  _MyLoginScreenState createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  var _formkey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clearText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 100),
                          child: FadeAnimationLogin(
                              1.2,
                              Text(
                                "PMAS",
                                style: GoogleFonts.merriweather(
                                  textStyle: TextStyle(
                                    fontSize: 75.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900)
                                ),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 190),
                          child: FadeAnimationLogin(
                              1.3,
                              Text(
                                "LOGIN",
                                style: GoogleFonts.merriweather(
                                  textStyle: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900),
                                )
                              )
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Column(
                      children: [
                        FadeAnimationLogin(
                          1.4,
                          TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter Your PhoneNumber";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "PHONE NUMBER",
                              labelStyle: GoogleFonts.merriweather(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FadeAnimationLogin(
                          1.5,
                          TextFormField(
                            controller: passwordController,
                            onChanged: (value)=>(passwordController.text),
                            keyboardType: TextInputType.number,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please enter Your Password";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "PASSWORD",
                              labelStyle: GoogleFonts.merriweather(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimationLogin(
                    1.6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 45,
                          width: 150,
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.orange.shade900,
                            elevation: 7.0,
                            child: GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState.validate()) {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: InstallerDashBoard(),
                                      ),
                                    );
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "INSTALLER",
                                    style: GoogleFonts.merriweather(
                                      textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    )
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 45,
                          width: 150,
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.orange.shade900,
                            elevation: 7.0,
                            child: GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState.validate()) {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: SuperVisorDashBoard(),
                                      ),
                                    );
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "SUPERVISOR",
                                    style: GoogleFonts.merriweather(
                                      textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    )
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeAnimationLogin(
                    1.7,
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/melonlogin.png'))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  clearText() {
    phoneNumberController.clear();
    passwordController.clear();
  }
}
