import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_mac/get_mac.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmas/util/utility.dart';
import '../data/installer_service.dart';
import '../data/is_model.dart';
import '../installerscreens/installationMenus.dart';
import '../installerscreens/installation_form.dart';
import '../model/installation_model.dart';
import '../util/database_helper.dart';

class ViewInstaller extends StatefulWidget {
  @override
  _ViewInstallerState createState() => _ViewInstallerState();
}

class _ViewInstallerState extends State<ViewInstaller> {
  bool upLoad = true;
  String syncOnline;
  InstallationData data;
  int count = 0;
  List<InstallationData> listOfData = <InstallationData>[];

  addInstallerData(IsModel isModel, _, InstallationData data) async {
    await InstallerService().addInstallerData(isModel).then((success) {
      if (success == true) {
        _showSnackBar(context, 'Synced online Successfully');
        _sync(context, data);
      } else {
        _showSnackBar(context, "Error Occur");
      }
    });
  }

  DatabaseHelper databaseHelper = DatabaseHelper();
  int index;
  String latitudeData = "UnKnown";
  String longitudeData = "UnKnown";
  String _macAddress = "UnKnown";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getCurrentLocation();
    getMacAddress();
    //_readNoDoList();
    getData();
  }

  Future<void> getMacAddress() async {
    String macAddress;
    try {
      macAddress = await GetMac.macAddress;
    } on PlatformException {
      macAddress = "Failed to get Device Mac Address";
    }
    if (!mounted) {
      setState(() {
        _macAddress = macAddress;
      });
    }
  }

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitudeData = position.latitude.toStringAsFixed(2);
      longitudeData = position.longitude.toStringAsFixed(2);
      print("Location = Longitude :$longitudeData and Latitude :$latitudeData");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (listOfData == null) {
      listOfData = List<InstallationData>();
      getData();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade900,
          automaticallyImplyLeading: false,
          title: Text(
            "View Installation",
            style:  GoogleFonts.merriweather(
            textStyle: TextStyle(color: Colors.white),
          )
          ),
          actions: [
            PopupMenuButton(
                color: Colors.white,
                onSelected: choiceMade,
                itemBuilder: (BuildContext context) {
                  return Menus.choice.map((String choice) {
                    return PopupMenuItem(value: choice, child: Text(choice));
                  }).toList();
                })
          ],
        ),
        body: getDataListView());
  }

  ListView getDataListView() {
    //TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, index) {
        data = listOfData[index];
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
                child: data.imgAfter == null
                    ? Image.asset("assets/pmastwo.png")
                    : Utility.imageFromBase64String(data.imgAfter)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.accountNumber),
                Text(
                  data.getSyncOnline,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            subtitle: Text(data.date),
            trailing: data.getSyncOnline == "false"
                ? InkWell(
                    onTap: () {
                      _checkInternetConnectivity(context, listOfData[index]);
                      //_sync(context, listOfData[index]);
                      print("Index:${data.id}");
                    },
                    child: Icon(
                      Icons.send,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      print("Index:${data.id}");
                      _showSnackBar(context, "Already Sent");
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.green,
                    ),
                  ),
            onLongPress: () {
              _delete(context: context, id: listOfData[index].id, index: index);
            },
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetails(listOfData[index], index);
            },
          ),
        );
      },
    );
  }

  void _delete({BuildContext context, int id, int index}) async {
    int result = await databaseHelper.deleteItem(id);
    if (result != 0) {
      _showSnackBar(context, 'Data Deleted Successfully');
      getData();
    }
  }

  void _sync(BuildContext context, InstallationData installationData) async {
    installationData.syncOnlines = "true";
    if (installationData.id != null) {
      var result = await databaseHelper.updateItem(installationData);
      if (result != 0) {
        //_showSnackBar(context, "update");
        print("Update and Sent Thank You");
        getData();
      }
    }
  }

  void getOneItem(
      BuildContext context, InstallationData installationData) async {
    installationData = await databaseHelper.getItem(installationData.id);
    IsModel isModel = IsModel(
      installation_id: installationData.id,
      meter_type: installationData.meterType,
      meter_number: installationData.meterNumber,
      customer_name: installationData.customerName,
      region: installationData.region,
      meter_status: installationData.meterStatus,
      image_after_installation: installationData.imgAfter,
      image_before_installation: installationData.imgBefore,
      seal_one: installationData.sealNumber,
      supervisor_name: installationData.supervisorName,
      area_office: installationData.areaOffice,
      address: installationData.address,
      account_number: installationData.accountNumber,
      installation_date: installationData.date,
      email_address: installationData.emailAddress,
      installer_name: installationData.installerName,
      mobile_number: installationData.mobileNumber,
      longitude: longitudeData,
      latitude: latitudeData,
      mac_address: _macAddress,
    );
    addInstallerData(isModel, context, installationData);
    print("All ID: ${isModel}");
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetails(InstallationData installationData, int index) async {
    bool result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FormForInstallation(
                  index: index,
                  installationData: installationData,
                )));
    //update the list when the user return
    if (result == true) {
      getData();
    }
  }

  void choiceMade(String value) {
    switch (value) {
      case "Refresh":
        print("I am Refresh");
        getData();
        break;
      case "Review App":
        break;
    }
  }

  _checkInternetConnectivity(
      BuildContext context, InstallationData installationData) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showSnackBar(context, "Please Connect to Internet");
    } else if (result == ConnectivityResult.mobile && data.id != null) {
      getOneItem(context, installationData);
      getCurrentLocation();
    } else if (result == ConnectivityResult.wifi && data.id != null) {
      getOneItem(context, installationData);
      getCurrentLocation();
    } else {
      _showSnackBar(context, 'No Data Found');
    }
  }

  //method to retrieve data from the database
  void getData() {
    final dbFuture = databaseHelper.initializeDatabase(); //open or create
    dbFuture.then((result) {
      final todoFuture = databaseHelper.getAllItem();
      todoFuture.then((result) {
        List<InstallationData> todoList = List<InstallationData>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          todoList.add(InstallationData.fromMapObject(result[i]));
          debugPrint(todoList[i].accountNumber);
        }
        setState(() {
          listOfData = todoList;
          count = count;
        });
        debugPrint("items " + count.toString());
      });
    });
  }
}
