
import 'package:flutter/material.dart';
import '../data/editSupervisorModel.dart';

class EditProfileSupervisior extends StatefulWidget {
  @override
  _EditProfileSupervisiorState createState() => _EditProfileSupervisiorState();
}

class _EditProfileSupervisiorState extends State<EditProfileSupervisior> {
  TextEditingController superVisorName = TextEditingController();
  TextEditingController nameOfCompany = TextEditingController();
  TextEditingController areaOffice = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  EditSuperVisorModel editSuperVisorModel;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        automaticallyImplyLeading: false,
        title: Text("Edit Profile",style: TextStyle(color: Colors.white),),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
             SuperVisorTextField(),
              phoneNumberTextField(),
              NameOfCompanyTextField(),
              NameOfCompanyTextField(),
              AddButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget SuperVisorTextField(){
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
        controller: superVisorName,
        onChanged: (value) => updateSupervisor(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "SuperVisor Name"
        ),
      ),
    );
  }
  Widget phoneNumberTextField(){
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
  Widget NameOfCompanyTextField(){
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
        controller: nameOfCompany,
        onChanged: (value) => updateNameofCompany(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Name of Company"
        ),
      ),
    );
  }
  Widget AreaOfficeTextField(){
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
        controller: areaOffice,
        onChanged: (value) => updateAreaOffoice(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Area Office"
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
           //cleanTextFeild();
            print("Move");
            }
          },
          elevation: 10,
          child: Text("Save",style: TextStyle(color:Colors.white),),
        ),
      ),
    );
  }

  updateSupervisor() {
    editSuperVisorModel.superVisorSet=superVisorName.text;
  }
  updateAreaOffoice(){
    editSuperVisorModel.areaOfOffice=areaOffice.text;
  }
  updateNameofCompany(){
    editSuperVisorModel.nameOfCompanys=nameOfCompany.text;
  }
  updatePhoneNumber(){
    editSuperVisorModel.phoneNumbers=phoneNumber.text;
  }
}
