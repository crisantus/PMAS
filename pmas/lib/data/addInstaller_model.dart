class AddInstallerModel{
  String installer_name;
  String phone_number;
  String address;
  String email;

  set installerName(String newInstallerName) {
    this.installer_name = newInstallerName;
  }
  set phoneNumber(String newPhoneNumber){
    this.phone_number=newPhoneNumber;
  }
  set addresss(String newAddress){
    this.address=newAddress;
  }
  set emails(String newEmail){
    this.email=newEmail;
  }

  AddInstallerModel({
      this.installer_name, this.phone_number, this.address, this.email});

  factory AddInstallerModel.fromJson(Map<String, dynamic> json){
    return AddInstallerModel(
      installer_name: json["installer_name"].toString(),
      phone_number: json["phone_number"].toString(),
      address: json["address"].toString(),
      email: json["email"].toString(),
    );
  }

  Map<String,dynamic> toJsonAdd(){
    return {
      "installer_name":installer_name,
      "phone_number":phone_number,
      "address":address,
      "email":email,
    };
  }
}