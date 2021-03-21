import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmas/screens/FadeAnimationThree.dart';
import '../installerscreens/installation_form.dart';
import '../model/installation_model.dart';
import '../util/database_helper.dart';

class NewInstaller extends StatefulWidget {
  @override
  _NewInstallerState createState() => _NewInstallerState();
}

class _NewInstallerState extends State<NewInstaller> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<InstallationData> installationD;
  int index;
  TextEditingController meterNumberController = new TextEditingController();
  String meterNumber;
  var _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clearText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        automaticallyImplyLeading: false,
        title: Text(
          "New Installation",
          style: GoogleFonts.merriweather(
            textStyle: TextStyle(color: Colors.white),
          )
        ),
      ),
      body: Form(
        key: _formkey,
        child: Center(
          child: Stack(
            children: [
              FadeAnimationThree(
                  1.3,
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/melon-meter.png",
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimationThree(
                        1.4,
                        Text(
                          "Hi Installer",
                          style: GoogleFonts.merriweather(
                            textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                          )
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    FadeAnimationThree(
                        1.5,
                        Text(
                          "Enter meter number to begin installation process",
                          style:GoogleFonts.merriweather(
                            textStyle:  TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(137, 137, 137, 1))
                          ),
                        ))
                  ],
                ),
              ),
              Positioned(
                bottom: 100,
                left: 20,
                right: 20,
                child: Container(
                  child: Column(
                    children: [
                      FadeAnimationThree(
                        1.7,
                        TextFormField(
                            controller: meterNumberController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter Meter Number";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) => updateMeterNumber(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              hintText: "Enter meter number",
                              hintStyle: GoogleFonts.merriweather(
                                textStyle: TextStyle(color: Colors.black),
                              ),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            )),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      FadeAnimationThree(
                          1.8,
                          Container(
                            width: MediaQuery.of(context).size.height,
                            height: 45,
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.orange.shade900,
                              elevation: 7,
                              child: GestureDetector(
                                onTap: () {
                                //   if (_formkey.currentState.validate()) {
                                //   Navigator.of(context).push(MaterialPageRoute(
                                //       builder: (context) => FormForInstallation(
                                //             MeterNumber: meterNumber,
                                //           )));
                                // }
                               moveTOInstallForm(InstallationData("","", "", "", "", "", "", "", "", "", "", "", "", "", "","",""),index);
                                },
                                child: Center(
                                    child: Text(
                                  "Verify Meter Number",
                                  style:GoogleFonts.merriweather(
                                   textStyle:  TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  )
                                )),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void moveTOInstallForm(InstallationData installationData, int index) {
     Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FormForInstallation(
        installationData: installationData,
        index: index,
      );
    }));
  }
  updateMeterNumber() {
    meterNumber = meterNumberController.text;
  }

  clearText() {
    meterNumberController.clear();
  }
}
