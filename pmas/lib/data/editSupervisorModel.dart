class EditSuperVisorModel{
  String superVisorModel;
  String nameOfCompany;
  String areaOfOffice;
  String phoneNumber;

  set superVisorSet(newSuperVisor){
    this.superVisorModel=newSuperVisor;
  }
  set nameOfCompanys(newNameOfCompany){
    this.nameOfCompany=newNameOfCompany;
  }
  set areaOfficess(newareaOfOffice){
    this.areaOfOffice=newareaOfOffice;
  }
  set phoneNumbers(newPhonenumber){
    this.phoneNumber=newPhonenumber;
  }

  EditSuperVisorModel({
    this.superVisorModel,this.nameOfCompany,this.phoneNumber,this.areaOfOffice});

  factory EditSuperVisorModel.fromJson(Map<String, dynamic> json){
    return EditSuperVisorModel(
      superVisorModel: json["supervisor_name"].toString(),
      phoneNumber: json["phone_number"].toString(),
      areaOfOffice: json["area_office"].toString(),
     // email: json["email"].toString(),
    );
  }

  Map<String,dynamic> toJsonAdd(){
    return {
      "supervisor_name":superVisorModel,
      "phone_number":phoneNumber,
      "area_office":areaOfOffice,
      //"email":email,
    };
  }
}