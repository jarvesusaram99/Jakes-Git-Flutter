import 'package:flutter/material.dart';
import 'package:gakes_git/Screens/fingerprint_page.dart';
import 'package:gakes_git/Screens/home.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Drawer(  
        child: SafeArea(
          child: ListView(  
            // Important: Remove any padding from the ListView.  
            padding: EdgeInsets.zero,  
            children: <Widget>[  
              const UserAccountsDrawerHeader(  
                accountName: Text("Jakes Wharton"),  
                accountEmail: Text("jakes@github.com"),  
                currentAccountPicture: CircleAvatar(  
                  backgroundColor: Colors.orange,  
                  child: Text(  
                    "A",  
                    style: TextStyle(fontSize: 40.0),  
                  ),  
                ),  
              ),  
              ListTile(  
                leading:const Icon(Icons.home), title: const Text("Home"),  
               onTap: () {  
                  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage())
                  );}
              ),  
              ListTile(  
                leading:const Icon(Icons.settings), title: Text("LogOut"),  
                onTap: () {  
                  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FingerprintPage())
                  );}
              ),  
            ],  
          ),
        ),  
    );
}
}