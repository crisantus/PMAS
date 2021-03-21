import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
     appBar: AppBar(
       backgroundColor: Colors.orange.shade900,
       automaticallyImplyLeading: false,
       title: Text("ChangePassword",style: GoogleFonts.merriweather(
         textStyle: TextStyle(color: Colors.white)
       ),),
     ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon(),
            _PassWord(),
            _NewPassWord(),
            _saveButton()
          ],
        ),
      )
    );
  }
  Widget icon(){
    return Container(
      alignment: Alignment.topCenter,
        child: Icon(Icons.lock,size: 150,color: Colors.black,)
    );
  }
  Widget _PassWord(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password",
            style: GoogleFonts.merriweather(
              textStyle:TextStyle(color: Colors.black87,fontSize: 20,
                fontWeight: FontWeight.bold) 
            ),),
            SizedBox(height: 5.0,),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Old Password",
                  hintStyle: TextStyle(color: Colors.brown),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                )
            )
          ],
        ),
      ),
    );
  }
  Widget _NewPassWord(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Confirm Password",
            style: GoogleFonts.merriweather(
              textStyle:TextStyle(color: Colors.black87,fontSize: 20,
                fontWeight: FontWeight.bold) 
            ),),
            SizedBox(height: 5.0,),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "New Password",
                  hintStyle: TextStyle(color: Colors.brown),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                )
            )
          ],
        ),
      ),
    );

  }
  Widget _saveButton(){
    return InkWell(
      onTap: (){

      },
      splashColor: Colors.brown,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 50,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange.shade900,
            elevation: 7,
            child: Center(
              child: Text("Change Password",style: GoogleFonts.merriweather(
                textStyle: TextStyle(fontWeight:FontWeight.bold,
              color: Colors.white,fontSize: 18),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
