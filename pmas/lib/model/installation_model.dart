import 'package:flutter/cupertino.dart';

class InstallationData {
  int _id;
  String _meterNumber;
  String _customerName;
  String _emailAddress;
  String _mobileNumber;
  String _accountNumber;
  String _areaOffice;
  String _address;
  String _installerName;
  String _sealNumber;
  String _region;
  String _supervisorName;
  String _meterStatus;
  String _imgBefore;
  String _imgAfter;
  String _meterType;
  String _date;
  String syncOnline;

  InstallationData(
      [this._meterNumber,
      this._customerName,
      this._emailAddress,
      this._mobileNumber,
      this._accountNumber,
      this._areaOffice,
      this._address,
      this._installerName,
      this._sealNumber,
      this._region,
      this._supervisorName,
      this._meterStatus,
      this._meterType,
      this._imgBefore,
      this._imgAfter,
      this.syncOnline,
      this._date]);

  int get id => _id;
  String get meterNumber => _meterNumber;
  String get customerName => _customerName;
  String get emailAddress => _emailAddress;
  String get mobileNumber => _mobileNumber;
  String get accountNumber => _accountNumber;
  String get areaOffice => _areaOffice;
  String get address => _address;
  String get installerName => _installerName;
  String get sealNumber => _sealNumber;
  String get region => _region;
  String get supervisorName => _supervisorName;
  String get meterStatus => _meterStatus;
  String get meterType => _meterType;
  String get imgBefore => _imgBefore;
  String get imgAfter => _imgAfter;
 String get getSyncOnline => syncOnline;
  String get date => _date;

  set meterNumbers(String newMeterNumber) {
    this._meterNumber = newMeterNumber;
  }

  set syncOnlines(String newSync) {
    this.syncOnline = newSync;
  }

  set customerNames(String newCustomerNumber) {
    this._customerName = newCustomerNumber;
  }

  set emailAddresss(String newEmailAddress) {
    this._emailAddress = newEmailAddress;
  }

  set mobileNumbers(String newMobileNumber) {
    this._mobileNumber = newMobileNumber;
  }

  set accountNumbers(String newAccountNumber) {
    this._accountNumber = newAccountNumber;
  }

  set areaOffices(String newAreaOffice) {
    this._areaOffice = newAreaOffice;
  }

  set addresss(String newAddress) {
    this._address = newAddress;
  }

  set installerNames(String newInstallerName) {
    this._installerName = newInstallerName;
  }

  set sealNumbers(String newSealNumber) {
    this._sealNumber = newSealNumber;
  }

  set regions(String newRegion) {
    this._region = newRegion;
  }

  set supervisorNames(String newSupervisorName) {
    this._supervisorName = newSupervisorName;
  }

  set meterTypes(String newMeterType) {
    this._meterType = newMeterType;
  }

  set meterStatuss(String newMeterStatus) {
    this._meterStatus = newMeterStatus;
  }

  set imgBefores(String newImgBefore) {
    this._imgBefore = newImgBefore;
  }

  set imgAfters(String newImgAfter) {
    this._imgAfter = newImgAfter;
  }

  set dates(String newDate) {
    this._date = newDate;
  }

  // Convert a Note object into a Map object use in putting data in sqlitedatabase
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }

    map['meterNumber'] = _meterNumber;
    map['customerName'] = _customerName;
    map['emailAddress'] = _emailAddress;
    map['accountNumber'] = _accountNumber;
    map['mobileNumber'] = _mobileNumber;
    map['areaOffice'] = _areaOffice;
    map['supervisorName'] = _supervisorName;
    map['imgAfter'] = _imgAfter;
    map['date'] = _date;
    map['imgBefore'] = _imgBefore;
    map['meterStatus'] = _meterStatus;
    map['region'] = _region;
    map['meterType'] = _meterType;
    map['sealNumber'] = _sealNumber;
    map['installerName'] = _installerName;
    map['address'] = _address;
    map['syncOnline'] = syncOnline;


    return map;
  }

  // Extract a Note object from a Map object removing/takingOut/extracting from db
  InstallationData.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._meterNumber = map['meterNumber'];
    this._customerName = map['customerName'];
    this._emailAddress = map['emailAddress'];
    this._mobileNumber = map['mobileNumber'];
    this._accountNumber = map['accountNumber'];
    this._areaOffice = map['areaOffice'];
    this._address = map['address'];
    this._installerName = map['installerName'];
    this._sealNumber = map['sealNumber'];
    this._region = map['region'];
    this._supervisorName = map['supervisorName'];
    this._meterStatus = map['meterStatus'];
    this._meterType = map['meterType'];
    this._imgBefore = map['imgBefore'];
    this._imgAfter = map['imgAfter'];
    this._date = map['date'];
    this.syncOnline = map['syncOnline'];
  }
}
