import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../installerscreens/installationMenus.dart';
import '../supervisorscreens/accountProfile.dart';
import '../supervisorscreens/addInstaller.dart';
import '../supervisorscreens/supervisorView_installations.dart';

class SuperVisorDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        automaticallyImplyLeading: false,
        title: Text('Supervisor',style: GoogleFonts.merriweather(
          textStyle: TextStyle(color:Colors.white,)
        ),),
        actions: [
          PopupMenuButton(
              color: Colors.white,
              onSelected: choiceMade,
              itemBuilder: (BuildContext context){
                return Menus.choice.map((String choice) {
                  return PopupMenuItem(
                      value: choice,
                      child: Text(choice));
                }).toList();
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 30,right: 30,top: 75),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              Card(
                margin: EdgeInsets.all(8),
                color: Colors.white,
                elevation: 20,
                child: InkWell(
                  onTap: (){
                    NavigateToPage(context,ViewInstallation());
                    print("ViewInstallation");
                  } ,
                  splashColor: Colors.brown,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.view_agenda_outlined,size: 70.0,color:Colors.brown,),
                        Column(
                          children: [
                            Text("View ",style: GoogleFonts.merriweather(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                            )
                            ),
                            Text("Installation ",style:  GoogleFonts.merriweather(
                              textStyle: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                            )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(8),
                color: Colors.white,
                elevation: 20,
                child: InkWell(
                  onTap: (){
                    print("Add workers");
                    NavigateToPage(context, AddInstaller());
                  } ,
                  splashColor: Colors.brown,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_box_outlined,size: 70.0,color:Colors.blue,),
                        Column(
                          children: [
                            Text("Add ",style:  GoogleFonts.merriweather(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                            )
                            ),
                            Text("Installer ",style: GoogleFonts.merriweather(
                              textStyle: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                            )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(8),
                color: Colors.white,
                elevation: 20,
                child: InkWell(
                  onTap: (){
                    print("View Worker");
                  } ,
                  splashColor: Colors.brown,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.vertical_split_sharp,size: 70.0,color:Colors.orangeAccent,),
                        Column(
                          children: [
                            Text("View ",style:  GoogleFonts.merriweather(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ))
                            ),
                            Text("Installers ",style:  GoogleFonts.merriweather(
                              textStyle: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                            )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(8),
                color: Colors.white,
                elevation: 20,
                child: InkWell(
                  onTap: (){
                    print("Account");
                    NavigateToPage(context, AccountProfile());
                  } ,
                  splashColor: Colors.brown,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person,size: 70.0,color:Colors.brown,),
                        Text("Account",style:  GoogleFonts.merriweather(
                              textStyle: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void NavigateToPage(BuildContext context,Widget child){
    Navigator.of(context).push(MaterialPageRoute(builder:(context) => child));
  }
  void choiceMade(String value) {
    switch(value){
      case "Sync data":
        print("I am here sync me");
        break;
      case "Review App":

        break;
    }
  }
}
