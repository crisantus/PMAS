import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.orange.shade900,
       automaticallyImplyLeading: false,
       title: Text("Edit Password",style: GoogleFonts.merriweather(
         textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
       )),
     ),
      body: ListView(
       children: [
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             children: [
               SizedBox(height: 50,),
               _PhoneNumber(),
               _InstallerName(),
               _EmailAddress(),
               _PassWord(),
               _HomeAddress(),
                SizedBox(height: 30,),
               Button(context),
               SizedBox(height: 30,)
             ],
           ),
         ),
       ],
      ),
    );
  }
  Widget _PhoneNumber(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0,),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.black87),
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
  Widget _InstallerName(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0,),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Your Name",
                  hintStyle: TextStyle(color: Colors.black87),
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
  Widget _EmailAddress(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0,),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black87),
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
  Widget _PassWord(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0,),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black87),
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
  Widget _HomeAddress(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0,),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Home Address",
                  hintStyle: TextStyle(color: Colors.black87),
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
  Widget Button(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.orange.shade900,
                elevation: 7.0,
                child: GestureDetector(
                    onTap: () {

                    },
                    child: Center(
                      child: Text(
                        "UPLOAD",
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
          ),
          SizedBox(width:10,),
          Expanded(
            child: Container(
              height: 45,
              width: 150,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.orange.shade900,
                elevation: 7.0,
                child: GestureDetector(
                    onTap: () {
                    },
                    child: Center(
                      child: Text(
                        "CANCEL",
                        style:  GoogleFonts.merriweather(
                          textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        )
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(height:20),
        ],
      ),
    );
  }
}
