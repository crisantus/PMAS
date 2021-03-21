import 'package:flutter/material.dart';
class ChangePasswordSuperVisior extends StatefulWidget {
  @override
  _ChangePasswordSuperVisiorState createState() => _ChangePasswordSuperVisiorState();
}

class _ChangePasswordSuperVisiorState extends State<ChangePasswordSuperVisior> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        automaticallyImplyLeading: false,
        title: Text("Change Password",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField("Old Password"),
            TextField("New Password"),
            AddButton()
          ],
        ),
      ),
    );
  }

  Widget TextField(hintText){
    return Padding(padding: EdgeInsets.all(30),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: hintText
        ),
      ),
    );
  }

  Widget AddButton(){
    return Padding(padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.orange.shade900,
            borderRadius: BorderRadius.circular(10)
        ),
        child: MaterialButton(
          onPressed: (){},
          elevation: 10,
          child: Text("Save",style: TextStyle(color:Colors.white),),
        ),
      ),
    );
  }
}
