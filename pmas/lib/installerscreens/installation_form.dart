import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pmas/util/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/installer_service.dart';
import '../data/is_model.dart';
import '../model/installation_model.dart';
import '../util/database_helper.dart';

class FormForInstallation extends StatefulWidget {
  final InstallationData installationData;
  final int index;
  final IsModel isModel;
  final int dataIndex;
  final String MeterNumber;

  FormForInstallation(
      {this.installationData,
      this.index,
      this.isModel,
      this.dataIndex,
      this.MeterNumber});

  @override
  _FormForInstallationState createState() =>
      _FormForInstallationState(this.installationData, this.index);
}

class _FormForInstallationState extends State<FormForInstallation> {
  TextEditingController meterNumberController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController areaOfficeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController installerNameController = TextEditingController();
  TextEditingController sealNumberController = TextEditingController();
  DatabaseHelper helper = DatabaseHelper();

  File imgFileBefore, imgFileAfter;
  String _imagePathBefore, _imagePathAfter;
  String nameRegion = "";
  var _formkey = GlobalKey<FormState>();

  var _Regions = [
    "anambra",
    "abuja",
    "nasarawa",
    "enugu",
    "yobe",
    "jigawa",
    "jos",
  ];
  var _currentItemSelected;

  var _MeterType = ["1 Phase", "3 phase", "MD Meter"];
  var _currentMeterSelected;

  var _SupervisorName = ["santus", "micheal", "ade", "king", "willy", "Biggy"];
  var _currentSupervisor;

  var _StatusMeter = ["uninstalled", "installed"];
  var _currentStatusMeter;

  InstallationData installationData;
  int index;
  bool editMode = false;
  _FormForInstallationState(this.installationData, this.index);
  DatabaseHelper db = new DatabaseHelper();

  updateInstallerData(IsModel isModel) async {
    await InstallerService().updateInstallerData(isModel).then((success) {
      print("UpdateInstallerData Successful");
      //toast Navigator.pop(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index != null) {
      _currentItemSelected = widget.installationData.region;
      _currentMeterSelected = widget.installationData.meterType;
      _currentSupervisor = widget.installationData.supervisorName;
      _currentStatusMeter = widget.installationData.meterStatus;
      meterNumberController.text = widget.installationData.meterNumber;
      customerNameController.text = widget.installationData.customerName;
      accountNumberController.text = widget.installationData.accountNumber;
      areaOfficeController.text = widget.installationData.areaOffice;
      addressController.text = widget.installationData.address;
      emailAddressController.text = widget.installationData.emailAddress;
      mobileNumberController.text = widget.installationData.mobileNumber;
      installerNameController.text = widget.installationData.installerName;
      sealNumberController.text = widget.installationData.sealNumber;
      _imagePathAfter = widget.installationData.imgBefore;
      _imagePathBefore = widget.installationData.imgAfter;
    } else if (widget.dataIndex != null) {
      editMode = true;
      _currentItemSelected = widget.isModel.region;
      _currentMeterSelected = widget.isModel.meter_type;
      _currentSupervisor = widget.isModel.supervisor_name;
      _currentStatusMeter = widget.isModel.meter_status;
      meterNumberController.text = widget.isModel.meter_number;
      customerNameController.text = widget.isModel.customer_name;
      accountNumberController.text = widget.isModel.account_number;
      areaOfficeController.text = widget.isModel.area_office;
      addressController.text = widget.isModel.address;
      emailAddressController.text = widget.isModel.email_address;
      mobileNumberController.text = widget.isModel.mobile_number;
      installerNameController.text = widget.isModel.installer_name;
      sealNumberController.text = widget.isModel.seal_one;
      _imagePathAfter = widget.isModel.image_before_installation;
      _imagePathBefore = widget.isModel.image_after_installation;
    } else {
      meterNumberController.text = widget.MeterNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // Write some code to control things, when user press Back navigation button in device navigationBar
        moveToLastScreen();
      },
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/background.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Positioned(
                          top: 20,
                          left: 15,
                          child: Container(
                            child: Text(
                              "Meter and Customer Detail \n Information",
                              style: GoogleFonts.merriweather(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _meterNumber(),
                        _customerName(),
                        _emailAddress(),
                        _mobileNumber(),
                        _accountNumber(),
                        _areaOffice(),
                        _address(),
                        _installerName(),
                        _sealNumber(),
                        dropdownRegion(),
                        dropdownMeterType(),
                        dropdownSuperVisorName(),
                        dropdownMeterstatus(),
                        _addImgBefore(context),
                        _addImgAfter(context),
                        _Button()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _meterNumber() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Meter Number",
            style: GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              controller: meterNumberController,
              onChanged: (value) => updateMeterNumber(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter meter number",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _customerName() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Name",
            style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              controller: customerNameController,
              onChanged: (value) => updateCustomerName(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter Name",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _emailAddress() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: GoogleFonts.merriweather(
              textStyle: GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              controller: emailAddressController,
              onChanged: (value) => updateEmailAddress(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter Email",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _mobileNumber() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mobile Number",
            style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              controller: mobileNumberController,
              onChanged: (value) => updateMobileNumber(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter mobile number",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _accountNumber() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Number",
            style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              controller: accountNumberController,
              onChanged: (value) => updateAccountNumber(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter account number",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _areaOffice() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Area office",
            style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              controller: areaOfficeController,
              onChanged: (value) => updateAreaOffice(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter Area Office",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _address() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address",
            style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              controller: addressController,
              onChanged: (value) => updateAddress(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter Address",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _installerName() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Installer's Name",
            style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              controller: installerNameController,
              onChanged: (value) => updateInstallerName(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter Installer's name",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _sealNumber() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Seal Number",
            style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Field required";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              controller: sealNumberController,
              onChanged: (value) => updateSealNumber(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter Seal Number",
                hintStyle: TextStyle(color: Colors.brown),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              ))
        ],
      ),
    );
  }

  Widget _addImgBefore(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 8, left: 8, right: 8),
      child: Card(
        elevation: 10,
        child: InkWell(
            onTap: () {
              _showChoiceDialog(context);
            },
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: imgFileBefore != null
                        ? Image.file(
                            imgFileBefore,
                            width: 120,
                            height: 97,
                          )
                        : Image.asset(
                            "assets/pmastwo.png",
                            width: 120,
                            height: 97,
                          )),
                Text(
                  "Image Before\nInstallation",
                  style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            )
                )
              ],
            )),
      ),
    );
  }

  Widget _addImgAfter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 8, left: 8, right: 8),
      child: Card(
        elevation: 10,
        child: InkWell(
            onTap: () {
              _showChoiceAfterDialog(context);
            },
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: imgFileAfter != null
                        ? Image.file(
                            imgFileAfter,
                            width: 120,
                            height: 97,
                          )
                        : Image.asset(
                            "assets/pmastwo.png",
                            width: 120,
                            height: 97,
                          )),
                Text(
                  "Image After\nInstallation",
                  style:  GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            )
                )
              ],
            )),
      ),
    );
  }

  Widget dropdownRegion() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Region",
            style:GoogleFonts.merriweather(
              textStyle:  TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            )
          ),
          DropdownButton<String>(
              hint: Text("Region", style: TextStyle(color: Colors.white)),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              items: _Regions.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                _onDropDownItemSelected(newValueSelected);
              },
              value: _currentItemSelected),
        ],
      ),
    );
  }

  Widget dropdownMeterType() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Meter Type",
            style:GoogleFonts.merriweather(
              textStyle:  TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            )
          ),
          DropdownButton<String>(
              hint: Text("Meter Type", style: TextStyle(color: Colors.white)),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              items: _MeterType.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                //your code to excute,when the menu item is selected from drop down
                _onDropDownMeterType(newValueSelected);
              },
              value: _currentMeterSelected),
        ],
      ),
    );
  }

  Widget dropdownSuperVisorName() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "SuperVisorName",
            style:GoogleFonts.merriweather(
              textStyle:  TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            )
          ),
          DropdownButton<String>(
            hint: Text("SuperVisorName", style: TextStyle(color: Colors.white)),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            items: _SupervisorName.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String newValueSelected) {
              //your code to excute,when the menu item is selected from drop down
              _onDropDownSupervisor(newValueSelected);
            },
            value: _currentSupervisor,
          ),
        ],
      ),
    );
  }

  Widget dropdownMeterstatus() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "MeterStatus",
            style:GoogleFonts.merriweather(
              textStyle:  TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            )
          ),
          DropdownButton<String>(
            hint: Text(
              "Meter Status",
              style: TextStyle(color: Colors.white),
            ),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            items: _StatusMeter.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String newValueSelected) {
              //your code to excute,when the menu item is selected from drop down
              _onDropDownMeterStatus(newValueSelected);
            },
            value: _currentStatusMeter,
          ),
        ],
      ),
    );
  }

  Widget _Button() {
    return Padding(
      padding: const EdgeInsets.all(15),
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
                      if (editMode) {
                        String dates =
                            DateFormat.yMMMd().format(DateTime.now());
                        IsModel isModel = IsModel(
                          installation_id: widget.isModel.installation_id,
                          meter_type: meterNumberController.text,
                          meter_number: meterNumberController.text,
                          customer_name: customerNameController.text,
                          region: _currentItemSelected,
                          meter_status: _currentStatusMeter,
                          image_after_installation: _imagePathAfter,
                          image_before_installation: _imagePathBefore,
                          seal_one: sealNumberController.text,
                          supervisor_name: _currentSupervisor,
                          area_office: areaOfficeController.text,
                          address: addressController.text,
                          account_number: accountNumberController.text,
                          installation_date: dates,
                          email_address: emailAddressController.text,
                          installer_name: installerNameController.text,
                          mobile_number: mobileNumberController.text,
                        );
                        updateInstallerData(isModel);
                      } else {
                        if (_formkey.currentState.validate()) {
                          _lastCheckB4save();
                        }
                      }
                    },
                    child: Center(
                      child: Text(
                        editMode ? "UPDATE" : "UPLOAD",
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
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 45,
              width: 150,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                elevation: 7.0,
                child: GestureDetector(
                    onTap: () {
                      _delete();
                    },
                    child: Center(
                      child: Text(
                        "DELETE",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Future _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a Choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future _showChoiceAfterDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a Choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGalleryAfter(context);
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openAfterCamera(context);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  _openGallery(BuildContext context) async {
    ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
      setState(() {
        imgFileBefore = imgFile;
        _imagePathBefore =
            Utility.base64String(imgFileBefore.readAsBytesSync());
      });
    });
  }

  _openGalleryAfter(BuildContext context) async {
    ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
      setState(() {
        imgFileAfter = imgFile;
        _imagePathAfter = Utility.base64String(imgFileAfter.readAsBytesSync());
      });
    });
  }

  _openCamera(BuildContext context) async {
    ImagePicker.pickImage(source: ImageSource.camera).then((imgFile) {
      setState(() {
        imgFileBefore = imgFile;
        _imagePathBefore =
            Utility.base64String(imgFileBefore.readAsBytesSync());
      });
    });
  }

  _openAfterCamera(BuildContext context) async {
    ImagePicker.pickImage(source: ImageSource.camera).then((imgFile) {
      setState(() {
        imgFileAfter = imgFile;
        _imagePathAfter = Utility.base64String(imgFileAfter.readAsBytesSync());
      });
    });
  }

  void _save() async {
    _saveImageToDb();
    installationData.dates = DateFormat.yMMMd().format(DateTime.now());
    installationData.syncOnlines = "false";
    if (installationData.id != null) {
      // Case 1: Update operation
      handleUpdate(installationData);
      Navigator.of(context).pop();
    } else {
      // Case 2: Insert Operation
      handleSubmitting(installationData);
      Navigator.of(context).pop();
    }
  }

  void _delete() async {
    moveToLastScreen();
    _deleteImage();
    _reLoadImage();
    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (installationData.id == null) {
      _showAlertDialog('Status', 'No Data was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteItem(installationData.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Data Deleted Successfully');
      clearText();
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Data');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
      installationData.regions = this._currentItemSelected;
    });
  }

  void _onDropDownMeterType(String newValueSelected) {
    setState(() {
      this._currentMeterSelected = newValueSelected;
      installationData.meterTypes = this._currentMeterSelected;
      print(newValueSelected);
    });
  }

  void _onDropDownSupervisor(String newValueSelected) {
    setState(() {
      this._currentSupervisor = newValueSelected;
      installationData.supervisorNames = this._currentSupervisor;
    });
  }

  void _onDropDownMeterStatus(String newValueSelected) {
    setState(() {
      this._currentStatusMeter = newValueSelected;
      installationData.meterStatuss = this._currentStatusMeter;
    });
  }

  void updateMeterNumber() {
    installationData.meterNumbers = meterNumberController.text;
  }

  void updateCustomerName() {
    installationData.customerNames = customerNameController.text;
  }

  void updateEmailAddress() {
    installationData.emailAddresss = emailAddressController.text;
  }

  void updateMobileNumber() {
    installationData.mobileNumbers = meterNumberController.text;
  }

  void updateAccountNumber() {
    installationData.accountNumbers = accountNumberController.text;
  }

  void updateAreaOffice() {
    installationData.areaOffices = areaOfficeController.text;
  }

  void updateAddress() {
    installationData.addresss = addressController.text;
  }

  void updateInstallerName() {
    installationData.installerNames = installerNameController.text;
  }

  void updateSealNumber() {
    installationData.sealNumbers = sealNumberController.text;
  }

  void clearText() {
    meterNumberController.clear();
    customerNameController.clear();
    emailAddressController.clear();
    accountNumberController.clear();
    areaOfficeController.clear();
    addressController.clear();
    installerNameController.clear();
    sealNumberController.clear();
    mobileNumberController.clear();
    // _imagePathBefore=null;
    // _imagePathAfter=null;
    _currentStatusMeter = null;
    _currentSupervisor = null;
    _currentItemSelected = null;
    _currentMeterSelected = null;
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _reLoadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.reload();
  }

  void _deleteImage() async {}
  void _saveImageToDb() {
    installationData.imgBefores = _imagePathBefore;
    installationData.imgAfters = _imagePathAfter;
  }

  void _lastCheckB4save() {
    if (_currentItemSelected != null &&
        _currentStatusMeter != null &&
        _currentSupervisor != null &&
        _currentMeterSelected != null &&
        _imagePathAfter != null &&
        _imagePathAfter != null) {
      _save();
      _saveImageToDb();
    //  Navigator.of(context).pop();
    } else {
      //show dialog
      _showAlertDialog(
          'Status',
          'You must choose,Region, '
              'Meter Type, Supervisor, Meter Status, Image Before Installation and Image After Installation');
    }
  }

  void handleSubmitting(InstallationData noDoItem) async {
    clearText();
    int result = await db.saveItem(noDoItem);
    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Data Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void handleUpdate(InstallationData installationData) async {
    int result = await helper.updateItem(installationData);
    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Data Updated Successfully');
    } else {
      // Success
      _showAlertDialog('Status', 'Failed to Update');
    }
  }
}
