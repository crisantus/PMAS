import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmas/model/installation_model.dart';
import '../util/database_helper.dart';

class InstallationMenu extends StatefulWidget {
  InstallationMenu({Key key}) : super(key: key);

  @override
  _InstallationMenuState createState() => _InstallationMenuState();
}

class _InstallationMenuState extends State<InstallationMenu> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  InstallationData data;
  String meterInstalled;
  String supervisorName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _read_installation_data_List();
    if (data == null) {
      meterInstalled = "0";
      supervisorName = "Unkown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        automaticallyImplyLeading: false,
        title: Text(
          "My DashBoard",
          style:GoogleFonts.merriweather(
            textStyle:  TextStyle(color: Colors.white),
          )
        ),
      ),
      body: Container(
        child: Column(
          children: [
            dashBoard("Total Meter Installed", meterInstalled),
            dashBoard("SuperVisor Name", supervisorName),
          ],
        ),
      ),
    );
  }

  Widget dashBoard(title, value) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 10,
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.orange,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child: Text(
                  title,
                  style: GoogleFonts.merriweather(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                  )
                )
                ),
                Container(
                    child: Text(
                  value,
                  style: GoogleFonts.merriweather(
                    textStyle: TextStyle(
                      fontSize: 32,
                      color: Colors.orange.shade900,
                      fontWeight: FontWeight.bold),
                  )
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _read_installation_data_List() async {
    List items = await databaseHelper.getAllItem();
    int count = await databaseHelper.getCount();
    items.forEach((item) {
      data = new InstallationData.fromMapObject(item);
      setState(() {
        meterInstalled = "$count";
        supervisorName = "${data.supervisorName}";
      });
      print('Db items: ${data.id}');
      print('Db items: ${data.region}'); //print out all the item by name
    });
  }
}
