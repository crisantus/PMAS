import 'package:flutter/material.dart';

import '../data/installer_service.dart';
import '../data/is_model.dart';
import '../installerscreens/installation_form.dart';

class ViewInstallation extends StatefulWidget {
  @override
  _ViewInstallationState createState() => _ViewInstallationState();
}

class _ViewInstallationState extends State<ViewInstallation> {

  List<IsModel> installationlist;
  bool loading=true;

  getAllInstallation() async{
    installationlist= await InstallerService().getInstallationData();
    setState(() {
      loading=false;
    });
    print("Installation : ${installationlist.length}");
  }

  deleteInstallation(IsModel isModel) async{
    await InstallerService().deleteInstallerData(isModel);
    setState(() {
      loading=false;
      getAllInstallation();
    });
    print("Installation Data deleted");
    //toast
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllInstallation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Installation"),
      ),
      body: loading ? Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: installationlist.length,
          itemBuilder: (context,index){
          IsModel data=installationlist[index];
            return ListTile(
              onTap: (){
                Navigator.of(context).
                push(MaterialPageRoute(builder: (context)
                => FormForInstallation(dataIndex: index,isModel: data,))).then((value) => getAllInstallation());
              },
              title:Text(data.meter_number),
              subtitle: Text(data.email_address),
              trailing: IconButton(icon: Icon(Icons.delete),
                  onPressed: (){
                deleteInstallation(data);
                  }),
            );
          }),
    );
  }
}
