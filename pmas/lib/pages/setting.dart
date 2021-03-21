import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../installerscreens/changePassword.dart';
import '../installerscreens/editProfile.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<String> settingsList = ["Edit Profile","Change Password","Review App"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        automaticallyImplyLeading: false,
        title: Text("Settings",style: GoogleFonts.merriweather(
          textStyle: TextStyle(color: Colors.white),
        )),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: settingsList.length,
        itemBuilder: (_,index){
          return Card(
            child: ListTile(
              title: Text(settingsList[index],
              style: GoogleFonts.merriweather(
                textStyle: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.grey),
              )),
              onTap: (){
               NavigateTo(settingsList[index]);
              },
            ),
          );
        }
        )
    );
  }

  void NavigateTo(String settingsList) {
    switch(settingsList){
      case "Edit Profile":
        print("I am Profile");
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile()));
        break;
      case "Change Password":
        print("I am Change Password");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword()));
        break;
      case "Review App":
        print("I am Review App");
        break;
    }
  }
}
