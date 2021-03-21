class IsModel{
  int installation_id;
  String meter_number;
  String customer_name;
  String email_address;
  String mobile_number;
  String account_number;
  String area_office;
  String address;
  String installer_name;
  String seal_one;
  String region;
  String supervisor_name;
  String meter_status;
  String image_before_installation;
  String image_after_installation;
  String meter_type;
  String installation_date;
  String latitude,longitude;
  String mac_address;

  IsModel({
      this.installation_id,
      this.meter_number,
      this.customer_name,
      this.email_address,
      this.mobile_number,
      this.account_number,
      this.area_office,
      this.address,
      this.installer_name,
      this.seal_one,
      this.region,
      this.supervisor_name,
      this.meter_status,
      this.image_before_installation,
      this.image_after_installation,
      this.meter_type,
      this.latitude,
      this.longitude,
      this.mac_address,
      this.installation_date});

  // IsModel.withOutId({
  //   this.meter_number,
  //   this.customer_name,
  //   this.email_address,
  //   this.mobile_number,
  //   this.account_number,
  //   this.area_office,
  //   this.address,
  //   this.installer_name,
  //   this.seal_one,
  //   this.region,
  //   this.supervisor_name,
  //   this.meter_status,
  //   this.image_before_installation,
  //   this.image_after_installation,
  //   this.meter_type,
  //   this.latitude,
  //   this.longitude,
  //   this.mac_address,
  //   this.installation_date});



  factory IsModel.fromJson(Map<String, dynamic> json){
    return IsModel(
        installation_id: json['installation_id'],
        meter_number: json['meter_number'] as String,
        customer_name: json['customer_name'] as String,
        email_address: json['email_address'] as String,
        mobile_number: json['mobile_number'] as String,
        account_number: json['account_number'] as String,
        area_office: json['area_office'] as String,
        address: json['address'] as String,
        installer_name: json['installer_name'] as String,
        seal_one: json['seal_one'] as String,
        region: json['region'] as String,
        supervisor_name: json['supervisor_name'] as String,
        meter_status: json['meterStatus'] as String,
        image_before_installation: json['image_before_installation'] as String,
        image_after_installation: json['image_after_installation'] as String,
        meter_type: json['meter_type'] as String,
        installation_date: json['installation_date']as String,
        longitude: json['longitude'].toString(),
        latitude: json['latitude'].toString(),
        mac_address: json['mac_address'].toString(),
    );
  }

    Map<String,dynamic> toJsonAdd(){
      return {
        "meter_number":meter_number,
        "customer_name":customer_name,
        "email_address":email_address,
        "mobile_number":mobile_number,
        "account_number":account_number,
        "area_office":area_office,
        "address":address,
        "installer_name":installer_name,
        "seal_one":seal_one,
        "region":region,
        "supervisor_name":supervisor_name,
        "meter_status":meter_status,
        "image_before_installation":image_before_installation,
        "image_after_installation":image_after_installation,
        "meter_type":meter_type,
        "installation_date":installation_date,
        "longitude":longitude,
        "latitude":latitude,
        "mac_address":mac_address
      };
    }


  Map<String,dynamic> toJsonUpdate(){
    return {
      "installation_id":installation_id,
      "meter_number":meter_number,
      "customer_name":customer_name,
      "email_address":email_address,
      "mobile_number":mobile_number,
      "account_number":account_number,
      "area_office":area_office,
      "address":address,
      "installer_name":installer_name,
      "seal_one":seal_one,
      "region":region,
      "supervisor_name":supervisor_name,
      "meter_status":meter_status,
      "image_before_installation":image_before_installation,
      "image_after_installation":image_after_installation,
      "meter_type":meter_type,
      "installation_date":installation_date,
      "longitude":longitude,
      "latitude":latitude,
      "mac_address":mac_address
    };
  }

}