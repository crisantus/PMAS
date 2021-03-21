
import 'package:flutter/material.dart';

import '../data/addInstaller_model.dart';
import '../data/installer_service.dart';

class AddInstaller extends StatefulWidget {
  @override
  _AddInstallerState createState() => _AddInstallerState();
}

class _AddInstallerState extends State<AddInstaller> {

  TextEditingController installerName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  AddInstallerModel installerModel;
  var _formkey = GlobalKey<FormState>();


  addInstallerAccount(AddInstallerModel addInstallerModel) async {
    await InstallerService().addInstallerAccount(addInstallerModel).then((success) {
      if(success==true){
        _showSnackBar(context, 'Added Successfully');
      }else{
        _showSnackBar(context, "Error Occur");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        title: Text("Add Installer",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InstallerName(),
                PhoneNumber(),
                Address(),
                Email(),
                AddButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
 Widget InstallerName(){
    return Padding(padding: EdgeInsets.all(20),
      child: TextFormField(
        validator:(value){
          if(value.isEmpty){
            return "Please Field required";
          }
          else{
            return null;
          }
        },
        controller: installerName,
        onChanged: (value) => updateInstallerName(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Installer Name"
        ),
      ),
    );
 }
  Widget PhoneNumber(){
    return Padding(padding: EdgeInsets.all(20),
      child: TextFormField(
        validator:(value){
          if(value.isEmpty){
            return "Please Field required";
          }
          else{
            return null;
          }
        },
        controller: phoneNumber,
        onChanged: (value) => updatePhoneNumber(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Phone Number"
        ),
      ),
    );
  }
  Widget Address(){
    return Padding(padding: EdgeInsets.all(20),
      child: TextFormField(
        validator:(value){
          if(value.isEmpty){
            return "Please Field required";
          }
          else{
            return null;
          }
        },
        controller: address,
        onChanged: (value) => updateaddress(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Address"
        ),
      ),
    );
  }
  Widget Email(){
    return Padding(padding: EdgeInsets.all(20),
      child: TextFormField(
        validator:(value){
          if(value.isEmpty){
            return "Please Field required";
          }
          else{
            return null;
          }
        },
        controller: email,
        onChanged: (value) => updateEmail(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Email"
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
          onPressed: (){
          if(_formkey.currentState.validate()){
             //show the user something
             cleanTextFeild();
             print("Move");
            // AddInstallerModel addInstallerModel=AddInstallerModel(
            //   installer_name: installerName.text,
            //   phone_number: phoneNumber.text,
            //   address: address.text,
            //   email: email.text
            // );
            addInstallerAccount(installerModel);
           }
          },
           elevation: 10,
          child: Text("Add Installer",style: TextStyle(color:Colors.white),),
        ),
      ),
    );
 }

   void updateInstallerName(){
    installerModel.installerName=installerName.text;
  }
  void updatePhoneNumber(){
    installerModel.phoneNumber=phoneNumber.text;
  }
  void updateaddress(){
    installerModel.addresss=address.text;
  }
  void updateEmail(){
    installerModel.emails=email.text;
  }

  void cleanTextFeild(){
    installerName.clear();
    phoneNumber.clear();
    address.clear();
    email.clear();
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
