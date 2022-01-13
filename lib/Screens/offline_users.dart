import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:gakes_git/Models/user_model.dart';
import 'package:gakes_git/Screens/online_users.dart';
import 'package:gakes_git/Widgets/appdrawer.dart';
import '../View/user_data_list.dart';

class OfflineUsers extends StatefulWidget {
  const OfflineUsers({Key? key}) : super(key: key);

  @override
  OfflineUsersState createState() =>  OfflineUsersState();
}

class OfflineUsersState extends State<OfflineUsers> {
  late List data;
    var subscription;
  var connectionStatus;
final snackBarWithoutInternet = const SnackBar(content: Text("Connect internet to get updated records")); 

final snackBarWithInternet  = const SnackBar(content: Text('You are now connected with internet.')); 
@override
  void initState(){
    super.initState();
 WidgetsBinding.instance!
        .addPostFrameCallback((_) => ScaffoldMessenger.of(context).showSnackBar(snackBarWithoutInternet));
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {         
      setState(() => connectionStatus = result );
        checkInternetConnectivity();
    });
  }
  checkInternetConnectivity() {
    if (connectionStatus == ConnectivityResult.none) {
    }
    else if(connectionStatus == ConnectivityResult.mobile)
    {
        ScaffoldMessenger.of(context).showSnackBar(snackBarWithInternet);
         Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OnlineUsers()));
    }
     else if(connectionStatus == ConnectivityResult.wifi)
    {
        ScaffoldMessenger.of(context).showSnackBar(snackBarWithInternet);
         Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OnlineUsers()));
    }
  }
 @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: AppDrawer(),
        appBar:  AppBar(
          title:  Text("Jakes Git",
            style:  TextStyle(color: Colors.white),),
        ),
        body:  Container(
          child:  Center(
            child:  FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/users.json'),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('Press button to start.');
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return  Center(child:  CircularProgressIndicator());
                    case ConnectionState.done:
                      if (snapshot.hasError){
                        return Text('Error: ${snapshot.error}');
                      }else{
                        List<Post> user =
                        parseJosn(snapshot.data.toString());
                        return user.isNotEmpty
                            ?  UsersData(users: user)
                            :  Text("file is empty");
                      }
                  }
                },
          ),
        ))
        );
  }
List<Post> parseJosn(String response) {
    if(response==null){
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) =>  Post.fromJson(json)).toList();
  }
}
