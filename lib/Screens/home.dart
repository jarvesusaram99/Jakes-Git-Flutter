import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:gakes_git/Screens/offline_users.dart';
import 'package:gakes_git/Screens/online_users.dart';
import 'package:gakes_git/Widgets/appdrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
 late var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetConnect(); // calls getconnect method to check which type if connection it 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Jakes Git"),
        
      ),
      body: Container()
    );
  }
  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        "",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
  Center ShowWifi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              ""),
          Text(""),
          Text(""),
          Text("")
        ],
      ),
    );
  }
  Center ShowMobile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your are Connected to  MOBILE DATA"),
        ],
      ),
    );
  }
  void GetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OfflineUsers()));
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OnlineUsers()));
            
   
    } else if (connectivityResult == ConnectivityResult.wifi) {
                Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OnlineUsers()));
   
    }
  }
}