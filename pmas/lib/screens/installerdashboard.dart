import 'package:flutter/material.dart';
import 'package:pmas/pages/installer_menuBoard.dart';

import '../pages/new_installation.dart';
import '../pages/setting.dart';
import '../pages/view_intallation.dart';

class InstallerDashBoard extends StatefulWidget {
  @override
  _InstallerDashBoard createState() => _InstallerDashBoard();
}

class _InstallerDashBoard extends State<InstallerDashBoard> {
  int currentTabIndex = 0;
  NewInstaller newInstaller;
  ViewInstaller viewInstaller;
  InstallationMenu installationMenu;
  Settings settings;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    installationMenu = InstallationMenu();
    newInstaller = NewInstaller();
    settings = Settings();
    viewInstaller = ViewInstaller();
    
    pages = [installationMenu, newInstaller, viewInstaller, settings];

    currentPage = installationMenu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        selectedItemColor: Colors.orange.shade900,
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text("DashBoard"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            title: Text("New Install"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            title: Text("View Install"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
      body: currentPage,
    );
  }
}
