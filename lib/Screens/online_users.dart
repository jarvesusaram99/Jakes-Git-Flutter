import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gakes_git/Widgets/appdrawer.dart';
 
class OnlineUsers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>  OnlineUsersState();
}
 
class OnlineUsersState extends State<OnlineUsers> {
final snackBar = SnackBar(content: Text(''));  
  static int page = 1;
  ScrollController _sc =  ScrollController();
  bool isLoading = false;
  List users = [];
  final dio =  Dio();
  @override
  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }
 
  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Jakes Git"),
      ),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
 
  Widget _buildList() {
    return ListView.separated(
     separatorBuilder: (_, __) => Divider(height: 0.5),
      physics: BouncingScrollPhysics(),
      itemCount: users.length + 1, // Add one more item for progress indicator
      padding: EdgeInsets.symmetric(vertical: 1.0),
      itemBuilder: (BuildContext context, int index) {
        if (index == users.length) {
          return _buildProgressIndicator();
        } else {
          // ignore: unnecessary_
          return ClipRect(
            child:Container(
              padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height/7,
                width: MediaQuery.of(context).size.width,
                 child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://avatars.githubusercontent.com/u/66577?v=4"))
                        )),
                     SizedBox(width: 10,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(users[index]['name'] ,style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                          ),),
                          Container(
                            height: 35,
                            child: 
                            users[index]['description']!=null? Text(users[index]['description']):Text("Null")
                          ),
                            SizedBox(height: 3,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.code_outlined),
                                  SizedBox(width: 5,),
                                  users[index]['language']!=null? Text(users[index]['language']):Text("Null")
                                 
                                ],
                              ),
                              SizedBox(width: 20,),
                               Row(
                              children: [
                                Icon(Icons.face_outlined),
                                SizedBox(width: 5,),
                                Text((users[index]['open_issues'].toString())
                                )
                              ],
                            ),
                              SizedBox(width: 30,),
                              Row(
                              children: [
                                Icon(Icons.face_outlined),
                                SizedBox(width: 5,),
                                Text((users[index]['watchers'].toString())
                                )
                              ],
                            )
                            ],
                          )
                        ],
                      ),
                    )],
                     ),
                     ),
          ); 
           }
      },
      controller: _sc,
    );
  }
  
  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      try{
      var url = "https://api.github.com/users/JakeWharton/repos?page=" +
          index.toString() +
          "&per_page=15";   
      print(url);
     
      final response = await dio.get(url);
      
      List tList = [];
      for (int i = 0; i < response.data.length; i++) {
        tList.add(response.data[i]);
      }

 
      setState(() {
        isLoading = false;
        users.addAll(tList);
        page++;
      });
      }
      catch(e){
      print("error");
  }
    }
  }
 
  Widget _buildProgressIndicator() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child:  Center(
        child:  Opacity(
          opacity: isLoading ? 1.0 : 00,
          child:  const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
