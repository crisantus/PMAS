import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'changePassword.dart';
import 'editProfile.dart';
class AccountProfile extends StatefulWidget {
  @override
  _AccountProfileState createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        automaticallyImplyLeading: false,
        title: Text("Account Profile",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              print("Edit Profile");
              NavigateToPage(context, EditProfileSupervisior());
            },
              child: text("Edit profile")),
          InkWell(
            onTap: (){
              print("Change Password");
              NavigateToPage(context, ChangePasswordSuperVisior());
            },
              child: text("Change Password")),
        ],
      ),
    );
  }

  Widget text(text){
    return  Padding(
      padding: EdgeInsets.only(top: 20,left: 20),
      child: Text(text,style: TextStyle(fontSize: 18),));
  }

  void NavigateToPage(BuildContext context,Widget child){
    Navigator.of(context).push(MaterialPageRoute(builder:(context) => child));
  }

}
