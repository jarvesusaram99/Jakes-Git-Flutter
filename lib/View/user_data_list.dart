import 'dart:convert';
import 'package:flutter/material.dart';

class UsersData extends StatefulWidget {
  final List users;
  UsersData({Key? key, required this.users}) : super(key: key);
  @override
  State<UsersData> createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersData> {
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      separatorBuilder: (_, __) => Divider(height: 0.5),
      itemCount:widget.users!=null? widget.users.length:0,
        // controller: _sc,
        itemBuilder: (BuildContext context, int index) {
          return
             Container(
               padding: const EdgeInsets.all(10),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  ),
               child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(image:AssetImage('assets/jakes.gif'))
                      )),
                   SizedBox(width: 10,),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.users[index].name.toString() ,style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                        ),),
                        Container(
                          height: 30,
                          child: Text(widget.users[index].description.toString())),
                          SizedBox(height: 3,),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.code_outlined),
                                SizedBox(width: 5,),
                                Text(widget.users[index].language.toString())
                              ],
                            ),
                            SizedBox(width: 20,),
                              Row(
                              children: [
                                Icon(Icons.adb_outlined),
                                SizedBox(width: 5,),
                                Text(widget.users[index].open_issues)
                              ],
                            ),
                            SizedBox(width: 30,),
                              Row(
                              children: [
                                Icon(Icons.face_outlined),
                                SizedBox(width: 5,),
                                Text(widget.users[index].watchers)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )],
                 )
              ); }
           );      
  }
}