import 'dart:convert';
import 'package:http/http.dart' as http;

import 'addInstaller_model.dart';
import 'is_model.dart';

class InstallerService {
  //"http://meronpmas.com/api.php"
  static const ADD_URL="http://meronpmas.com/api.php";
  static const VIEW_URL="";
  static const UPDATE_URL="";
  static const delete_URL="";
  static const ADD_INSTALLER_URL="";

  Future<bool> addInstallerData(IsModel isModel) async {
    http.Response response =await http.post(ADD_URL,body: jsonEncode(isModel.toJsonAdd()),
        headers:<String ,String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if(response.statusCode == 200){
      // print("ADD ${IsModel.fromJson(jsonDecode(response.body))}");
      return true;
    }else{
      return false;
    }
  }

  Future<bool> addInstallerAccount(AddInstallerModel addInstallerModel) async {
    http.Response response =await http.post(ADD_INSTALLER_URL,body: jsonEncode(addInstallerModel.toJsonAdd()),
        headers:<String ,String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if(response.statusCode == 200){
      // print("ADD ${IsModel.fromJson(jsonDecode(response.body))}");
      return true;
    }else{
      return false;
    }
  }

  List<IsModel> installationFromJson(String jsonString){
    final data= json.decode(jsonString);
    return List<IsModel>.from(data.map((item) => IsModel.fromJson(item)));
  }

  Future<List<IsModel>> getInstallationData() async {
    final response = await http.get(VIEW_URL);
    if(response.statusCode == 200){
    List<IsModel> list = installationFromJson(response.body);
    return list;
    }else{
      return List<IsModel>();
    }
  }

  Future<IsModel> updateInstallerData(IsModel isModel) async {
    final response =await http.post(UPDATE_URL,body: jsonEncode(isModel.toJsonUpdate()));
    if(response.statusCode == 200){
      print("Update Data : "+response.body);
      return IsModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to Installation Data");
    }
  }

  Future<IsModel> deleteInstallerData(IsModel isModel) async {
    final response =await http.post(delete_URL,body: isModel.toJsonUpdate());
    if(response.statusCode == 200){
      print("Delete Data : "+response.body);
      return IsModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to Installation Data");
    }
  }
}